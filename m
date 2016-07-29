From: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Subject: Automated autobuilder emails.
Date: Thu, 28 Jul 2016 19:16:58 -0700
Message-ID: <20160729021658.GA15676@x>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

I'm sending this to you because you're the two @mediatek.com folks
listed in the kernel MAINTAINERS file, and other mediatek addresses I've
tried have bounced.  I'm hoping you know the right people to contact and
can forward this mail if needed.

It looks like mediatek has an internal autobuilder,
adm_jenkins-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org , sending automated mails about kernel builds
outside of Mediatek, to various people at Samsung, @google.com,
@chromium.org, and myself.  Based on that selection of addresses, I'm
guessing you're trying to run an autobuilder related to Chrome OS?

The autobuilder mails (sample below) include links to servers within
mediatek, making them unhelpful for people outside of mediatek.  Could
you please not send such mails to people outside your company?

If you're trying to run a build-checking service for people outside your
company, you'd need to make the documentation and build logs accessible
to people outside your company.  And if you're running an entirely
internal autobuilder, it shouldn't be sending mails outside your
company.

Thanks,
Josh Triplett

On Fri, Jul 29, 2016 at 02:56:44AM +0800, adm_jenkins-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> Dear pals,
> linux-apollo-golden-1501-1620-7-001 - Build # 2016-07-28_14-22-08 - Failure:
> Check console output at
>  http://mtksdtbm24:8080/job/linux-apollo-golden-1501-1620-7-001/325/ to view
>  the results
>
> Build Tag:
> t-linux-apollo-golden-1501-1620-7-001-autobuild-fail-20160728142208
> Clean Build:  true
> Image Location:
> https://share.mediatek.inc/browse/shares/8?path=%2Fdtv_release1%2Fautobuild_image%2Fdtv_git
>  (\\mtksfs19\dtv_release1\autobuild_image\dtv_git)
> Full Log:
> \\mtksfs19\dtv_release1\autobuild_log\dtv_git\apollo-golden-1501-1620-7-001\2016-07-28_14-22-08
