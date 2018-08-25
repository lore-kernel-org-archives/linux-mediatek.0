From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH 02/17] mt76: rename mt76x2_regs.h
Date: Sat, 25 Aug 2018 13:56:47 +0200
Message-ID: <f5537708-b3b6-1d0c-1461-7a08ca48b51b@nbd.name>
References: <1535109321-17126-1-git-send-email-sgruszka@redhat.com>
 <1535109321-17126-3-git-send-email-sgruszka@redhat.com>
 <2172355a-0703-e432-96cb-fba2383c3890@nbd.name>
 <20180825113149.GA13833@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180825113149.GA13833-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 2018-08-25 13:31, Stanislaw Gruszka wrote:
> On Sat, Aug 25, 2018 at 11:00:39AM +0200, Felix Fietkau wrote:
>> On 2018-08-24 13:15, Stanislaw Gruszka wrote:
>> > MAC registers are the same for mt76x0 and mt76x2. Rename mt76x2_regs.h
>> > file to reflect that.
>> > 
>> > Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> > ---
>> >  drivers/net/wireless/mediatek/mt76/mt76x2.h      |   2 +-
>> >  drivers/net/wireless/mediatek/mt76/mt76x2_regs.h | 619 -----------------------
>> >  drivers/net/wireless/mediatek/mt76/mt76xx_regs.h | 619 +++++++++++++++++++++++
>> I think mt76xx_regs.h is named too generic. MT7603, MT7628, MT7615 and
>> all newer chips use a completely different register layout.
>> I'd prefer to stick with mt76x2_regs for now and use it for x0 as well.
> 
> I thought about that too, but choose it will be better to have some
> prefix that will indicate the function/structure/header is shared between
> the x0 and x2 drivers to not confuse mt76x2 code that is mt76x2 only
> and one that is shared.
> 
> I choose mt76xx name, considered mt76 to be generic prefix shared also 
> between old and new chips. But yeah this mt76xx name also "contains" new
> chips. How about mt76old_ or mt76og_ (old generation) ?
I think this looks even more confusing. Also, please keep in mind that
'old' is relative as well.
How about mt76x02?

- Felix
