From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] staging: mt7621-mmc: MIPS: ralink: add sdhci for
 mt7620a SoC
Date: Fri, 6 Apr 2018 10:09:54 +0300
Message-ID: <20180406070954.6qldityn5odfqhdp@mwanda>
References: <20180405121310.GA7782@mwanda>
 <20180405163947.GA20350@demeter.lkamp.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20180405163947.GA20350@demeter.lkamp.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: blogic@openwrt.org, devel@driverdev.osuosl.org, NeilBrown <neil@brown.name>, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Apr 05, 2018 at 06:39:47PM +0200, Christian L=FCtke-Stetzkamp wrote:
> =

> Hi Dan,
> =

> thanks for the report, I have created patches for all of these and
> will send them, once my previous series got merged, because I based
> them on that status.

I would just be optimistic and send them now.  Greg applies things in
first come first serve basis.  He's likely to apply your series, right?

The worst that can happen is that there is a conflict and Greg asks to
rebase your patches.  Greg doesn't invest any time into figuring out why
your patch doesn't apply so it's not a huge burden.

It feels sort of rude talking about Greg like a machine, but to me
having a very predictable maintainer is a fantastic thing.  I try to be
machine-like when I am reviewing patches because it removes a lot of the
questions about "am I being too mean to someone?".

regards,
dan carpenter
