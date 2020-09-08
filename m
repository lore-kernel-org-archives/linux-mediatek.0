Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574E5C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 14:14:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F9E229C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 14:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O5JFEwcv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kIRfaUoI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01F9E229C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iOIqIIEWifyPzNOofVJkmxjO2MxwGkfu9mlaigb9YZs=; b=O5JFEwcvvfhfVPDYAhhgPbrNW
	ZD0lnmcrJyDJ+Dx+54D3yu/5G6uZ4JhvxNHA35BY/K9ZTR/By52+IhlmxjQG0VpIGwjU9niD4DyBu
	uIvGgqvn8cFFPz7o6zYRFe019ScMArFrei3o+eAuHaHZhIEMpif66WYaIOEiqQNM47KYEVDQ5Cj9U
	CeybbLTuqe0Y7wF03pm0tENc/hOyBST5OerXPY56efdaZXBXEHFCAsccgJOvSmkSJ6S8rmg8H9Vug
	URZ+rxnUOE8N/YB7q75OSLDpHTtxqt36ImRsDqT/JiqKzgvIHEVMfWSP6b9xpD5QuMUk4RjjZ6zQN
	eGaAIzBcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFeOF-0008Dt-6a; Tue, 08 Sep 2020 14:14:31 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFeOA-0008Ck-NR; Tue, 08 Sep 2020 14:14:27 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088EEO62040774;
 Tue, 8 Sep 2020 09:14:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599574464;
 bh=362EVhcP1ExwtmVZiQkIb5x6Yg4rPvLgH1gDwH3m8P4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=kIRfaUoIMVEntv78JAUsTIXtMMJEhxv7cGcQV8JdKjfYyvxEslm6+klfuWWV8PCji
 zXvd7SD3ie+BbiWV0LoSzILEcIvwQ7D/nhiJMtSZDoxYy7eL5A09dUrxLA0zSTK9Yx
 71o1uqiBsnwjDYle0QVuf2+aBoI6F3mZmWhdjAOs=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 088EEOLZ045543
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Sep 2020 09:14:24 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Sep
 2020 09:14:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Sep 2020 09:14:24 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088EEOFG106227;
 Tue, 8 Sep 2020 09:14:24 -0500
Subject: Re: [PATCH v3 0/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, <jacek.anaszewski@gmail.com>,
 <pavel@ucw.cz>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <b8d090b7-ef47-d434-1af1-2afbc2ad30ae@ti.com>
Date: Tue, 8 Sep 2020 09:14:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_101427_004454_A882EA75 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Gene

On 9/7/20 5:27 AM, Gene Chen wrote:
> In-Reply-To:
>
> This patch series add MT6360 LED support contains driver and binding document

I cannot find the v2 patch series for this.

Dan


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
