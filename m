From: Jorge Ramirez <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Date: Tue, 10 May 2016 11:18:29 -0400
Message-ID: <5731FBC5.4090009@linaro.org>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160510141335.442d3d7b@bbrezillon> <5731F40B.801@linaro.org>
 <20160510165943.0322b374@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160510165943.0322b374@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 05/10/2016 10:59 AM, Boris Brezillon wrote:
> On Tue, 10 May 2016 10:45:31 -0400
> Jorge Ramirez<jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>  wrote:
>
>> >On 05/10/2016 08:13 AM, Boris Brezillon wrote:
>>>> > >>+struct mtk_ecc {
>>>>> > >> >+	struct device *dev;
>>>>> > >> >+	void __iomem *regs;
>>>>> > >> >+	struct clk *clk;
>>>>> > >> >+
>>>>> > >> >+	struct completion done;
>>>>> > >> >+	struct semaphore sem;
>>> > >You tried to explain me why you decided to go for a semaphore instead of
>>> > >a mutex, but I don't remember. Could you explain it again?
>>> > >If that's all about being interruptible, then you can use
>> >
>> >Just for flexibility, no other reason really.
>> >Neither the mutex nor the semaphore are actually needed in this driver.
>> >Not knowing how things are going to evolve in the upper layers of MTD I
>> >didn't feel comfortable taking a lock in a function and unlocking the
>> >mutex in a different function (which is the way this driver operates).
>> >with that in mind I opted for a semaphore since it can always be
>> >unlocked -if needed be- by a different thread.
> But that has nothing to do with possible evolutions in the MTD layer.
> The ECC engine resource can only have a single user at a time, hence
> the mutex approach. Sorry, but I don't understand the "flexibility"
> argument, but maybe I'm misunderstanding the different between a
> semaphore and a mutex.

mutex can only be unlocked by the same thread that locks it. if for some 
reason (hypotetically speaking) the MTD wishes to unlock ecc engines and 
implement an abort operation before running operations complete this 
could guarantee that the ecc engine is left in an unlocked state. the 
risk of having a mutex in this driver is that the lock/unlock happen in 
_different_ function calls (which is always scary) with DMAs having to 
complete in between so if the running thread was canceled before the 
mutex protecting the resource was unlocked we would never be able to 
unlock it....with a semaphore we could (any thread could unlock the 
resource).
