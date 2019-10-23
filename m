Return-Path: <SRS0=HtVu=YQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4133ECA9EAE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 05:42:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0764A2173B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 05:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H3ijxbwg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="p58WL8S1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0764A2173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CvGG/ZRew4RLokQX5CMzdEKDl71Qo4gznkTBA3Klvo=; b=H3ijxbwgC8iJJV
	5KvpugNvMYfy0iuStqQs8Uj0OmcYtSKnM3yFTqvWNGaBQqtA2IiEylYRRwLh+Zant3e1ZWUI59P9y
	VtcXvJscM7vjlPn7DV/VX6x7UX2iJ1INC4NSsmcd7YnwRXpp94SxFVsp+Ioka/L2UlX68sRG9cVwr
	LlByNYx9qVbNw5LmlU9Hn4oKtp5/ERPNyK+r3xKPXmuKws+LfUsIAg4f0Ej/1EhrEFr6tIBynMgnj
	7VGtH4OXH907ddLhmzvZYNU4zHW73vH1ItoDLtURF50H4jUS91qdVLvYxmX4agJRaDGocyJnKH04h
	0yN0QvF/Jj7HqJmqACkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iN9Pk-0007X0-RI; Wed, 23 Oct 2019 05:42:32 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iN9PY-0007Fq-7W; Wed, 23 Oct 2019 05:42:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9N5gC3H022595;
 Wed, 23 Oct 2019 00:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1571809332;
 bh=loVH+PYRxm3OpLF9LdBwXFuK6Y4m05IaOaKEfYsJyAw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=p58WL8S1GmDISYuKnhXNvZOeoUrdYkV463yym9NPfhRAo+iXa+g8Yy3fcFkrbFq25
 yYJ1bfHdTyIVAT+qswO8C0xpw5FLvVQpuJgSjvVlzOopFBeuQic9qIgtN37tpmlq4o
 7DZ7fqtNrh9Cic2tWE6XjqRuRNO/gF7vMzJfcSK0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9N5gBAG020654
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Oct 2019 00:42:12 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 23
 Oct 2019 00:42:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 23 Oct 2019 00:42:01 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9N5ecZS004724;
 Wed, 23 Oct 2019 00:40:39 -0500
Subject: Re: [PATCH v2 04/11] dt-bindings: phy-mtk-tphy: add a new reference
 clock
To: Rob Herring <robh@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <1567149298-29366-1-git-send-email-chunfeng.yun@mediatek.com>
 <1567149298-29366-4-git-send-email-chunfeng.yun@mediatek.com>
 <20190917202805.GA13405@bogus>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <32bc288e-dbbb-8930-4750-826e9e17d58c@ti.com>
Date: Wed, 23 Oct 2019 11:10:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917202805.GA13405@bogus>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_224220_312958_01661AE7 
X-CRM114-Status: GOOD (  16.76  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

On 18/09/19 1:58 AM, Rob Herring wrote:
> On Fri, 30 Aug 2019 15:14:51 +0800, Chunfeng Yun wrote:
>> Usually the digital and analog phys use the same reference clock,
>> but on some platforms, they are separated, so add another optional
>> clock to support it.
>> In order to keep the clock names consistent with PHY IP's, use
>> the da_ref for analog phy and ref clock for digital phy.
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> ---
>> v2: fix typo of analog and needed
>> ---
>>  Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>

I see you've acked a couple of patches in the series. However the other
dt-binding patch neither has an Ack or NAK. Is there a specific reason or can I
merge the series?

Thanks
Kishon

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
