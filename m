From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64/mm: remove unnecessary boundary check
Date: Fri, 26 Feb 2016 13:40:33 +0000
Message-ID: <20160226134033.GK4777@e104818-lin.cambridge.arm.com>
References: <1456371874-19826-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456371874-19826-1-git-send-email-miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: srv_wsdupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Feb 25, 2016 at 11:44:34AM +0800, miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Remove the unnecessary boundary check since there is a huge
> gap between user and kernel address that they would never overlap.
> (arm64 does not have enough levels of page tables to cover 64-bit
> virtual address)
> 
> See Documentation/arm64/memory.txt
> 
> Signed-off-by: Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Applied. Thanks.

-- 
Catalin
