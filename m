Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467A0C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 11:09:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C2223124
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 11:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C2223124
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UZq3J/vQQjFJ9TYdb9Y+kvKYo57oJyidgvlNm8fmFdg=; b=yR5KDP3WjTMDB8WxchNicqP19
	oT9cXV2qAtrR8VTXfRF3b8mrtW8MF7KnLPGigpP82vuJRoH7F+fG7lkXQeSmDpjq/W2z1J2vblpQy
	x7cgZLRxa1cBD7S2w0mgqi/ZCbo/QDDKm4JuL3mmTBejjkBYqFkjEXRR6P7Fss9E6mad/D0nNW6hp
	h4Flt2xIn0/OSqD0ONVaUdwKOHzpEvO8SLgcbrwo2FeOgWx9U4yJ/pNGhYRgKSwSeCmfxUDxOUbhY
	RnVnt+RMax7Xl2YQN7UH2GSerdAkDM9gpkFbPfGmYEhrWXOZxcwiO875tXSpGTBHKpdxAlrJCP4bO
	AbdyBoQEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpUgM-0000YT-AM; Wed, 16 Dec 2020 11:09:22 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpUb1-0005Oa-PT
 for linux-mediatek@lists.infradead.org; Wed, 16 Dec 2020 11:03:56 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-94--UvXZFBAOeinyWm-PmDBBw-1; Wed, 16 Dec 2020 11:03:46 +0000
X-MC-Unique: -UvXZFBAOeinyWm-PmDBBw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 16 Dec 2020 11:03:46 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 16 Dec 2020 11:03:46 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Yong Wu' <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: RE: [PATCH v3 4/7] iommu: Switch gather->end to unsigned long long
Thread-Topic: [PATCH v3 4/7] iommu: Switch gather->end to unsigned long long
Thread-Index: AQHW05fCvUUyI8/vv0eBmqh9Irindan5jgVQ
Date: Wed, 16 Dec 2020 11:03:46 +0000
Message-ID: <6b4a1d37a90f4663adf6b4adb9f80e2b@AcuMS.aculab.com>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-5-yong.wu@mediatek.com>
In-Reply-To: <20201216103607.23050-5-yong.wu@mediatek.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_060352_896192_349FB413 
X-CRM114-Status: GOOD (  15.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "youlin.pei@mediatek.com" <youlin.pei@mediatek.com>,
 "anan.sun@mediatek.com" <anan.sun@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>,
 "chao.hao@mediatek.com" <chao.hao@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tfiga@google.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>,
 "kernel-team@android.com" <kernel-team@android.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yong Wu
> Sent: 16 December 2020 10:36
> 
> Currently gather->end is "unsigned long" which may be overflow in
> arch32 in the corner case: 0xfff00000 + 0x100000(iova + size).
> Although it doesn't affect the size(end - start), it affects the checking
> "gather->end < end"
> 
> Fixes: a7d20dc19d9e ("iommu: Introduce struct iommu_iotlb_gather for batching TLB flushes")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  include/linux/iommu.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 794d4085edd3..6e907a95d981 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -178,7 +178,7 @@ enum iommu_dev_features {
>   */
>  struct iommu_iotlb_gather {
>  	unsigned long		start;
> -	unsigned long		end;
> +	unsigned long long	end;
>  	size_t			pgsize;
>  };

Doesn't that add two pad words on many 32bit systems?
You probably ought to re-order the structure to keep the fields
on their natural boundaries.

I'm not sure what is being mapped here, but could it make sense
to just avoid using the highest addresses?
Then you never hit the problem.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
