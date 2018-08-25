From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 02/17] mt76: rename mt76x2_regs.h
Date: Sat, 25 Aug 2018 16:44:54 +0200
Message-ID: <20180825144453.GA14397@redhat.com>
References: <1535109321-17126-1-git-send-email-sgruszka@redhat.com>
 <1535109321-17126-3-git-send-email-sgruszka@redhat.com>
 <2172355a-0703-e432-96cb-fba2383c3890@nbd.name>
 <20180825113149.GA13833@redhat.com>
 <f5537708-b3b6-1d0c-1461-7a08ca48b51b@nbd.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f5537708-b3b6-1d0c-1461-7a08ca48b51b-Vt+b4OUoWG0@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, Aug 25, 2018 at 01:56:47PM +0200, Felix Fietkau wrote:
> >> I think mt76xx_regs.h is named too generic. MT7603, MT7628, MT7615 and
> >> all newer chips use a completely different register layout.
> >> I'd prefer to stick with mt76x2_regs for now and use it for x0 as well.
> > 
> > I thought about that too, but choose it will be better to have some
> > prefix that will indicate the function/structure/header is shared between
> > the x0 and x2 drivers to not confuse mt76x2 code that is mt76x2 only
> > and one that is shared.
> > 
> > I choose mt76xx name, considered mt76 to be generic prefix shared also 
> > between old and new chips. But yeah this mt76xx name also "contains" new
> > chips. How about mt76old_ or mt76og_ (old generation) ?
> I think this looks even more confusing. Also, please keep in mind that
> 'old' is relative as well.
> How about mt76x02?

Ok to me. 

Stanislaw
