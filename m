From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH net] net: dsa: mt7530: Use NULL instead of plain integer
Date: Wed, 4 Apr 2018 01:31:51 +0800
Message-ID: <1522776711.12959.1.camel@mtkswgap22>
References: <20180402232414.19671-1-f.fainelli@gmail.com>
 <1522721904.18424.51.camel@mtkswgap22>
 <f5aa0467-8124-b097-2b89-dcf1698a5ba5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <f5aa0467-8124-b097-2b89-dcf1698a5ba5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2018-04-03 at 10:02 -0700, Florian Fainelli wrote:
> On 04/02/2018 07:18 PM, Sean Wang wrote:
> > On Mon, 2018-04-02 at 16:24 -0700, Florian Fainelli wrote:
> >> We would be passing 0 instead of NULL as the rsp argument to
> >> mt7530_fdb_cmd(), fix that.
> >>
> > 
> > Acked-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > BTW, does the part of the commit message should be updated with "passing
> > NULL instead of 0"?
> 
> I don't follow you, the commit message indicates what we were doing
> which implies it was wrong and fixes it. Would you want me to reword
> that part?

thanks for the explanation.

the commit message is clear and okay for me now
