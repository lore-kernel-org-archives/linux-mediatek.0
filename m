From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: Automated autobuilder emails.
Date: Fri, 29 Jul 2016 17:24:27 +0800
Message-ID: <1469784267.12040.3.camel@mtksdaap41>
References: <20160729021658.GA15676@x>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160729021658.GA15676@x>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Cc: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

On Thu, 2016-07-28 at 19:16 -0700, Josh Triplett wrote:
> Hi,
> 
> I'm sending this to you because you're the two @mediatek.com folks
> listed in the kernel MAINTAINERS file, and other mediatek addresses I've
> tried have bounced.  I'm hoping you know the right people to contact and
> can forward this mail if needed.
> 
> It looks like mediatek has an internal autobuilder,
> adm_jenkins-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org , sending automated mails about kernel builds
> outside of Mediatek, to various people at Samsung, @google.com,
> @chromium.org, and myself.  Based on that selection of addresses, I'm
> guessing you're trying to run an autobuilder related to Chrome OS?
> 
> The autobuilder mails (sample below) include links to servers within
> mediatek, making them unhelpful for people outside of mediatek.  Could
> you please not send such mails to people outside your company?
> 
> If you're trying to run a build-checking service for people outside your
> company, you'd need to make the documentation and build logs accessible
> to people outside your company.  And if you're running an entirely
> internal autobuilder, it shouldn't be sending mails outside your
> company.
> 
> Thanks,
> Josh Triplett
> 

We already suspend our Jenkins auto build, and will modify mailing rule
to avoid sending mail outside Mediatek company.Sorry for your
inconvenience.

Eddie
Thanks
