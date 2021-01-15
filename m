Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED76C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 13:47:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1EDA23382
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 13:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1EDA23382
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7y1gdehb7FrueOnaTHlNq0z81jJaeDL137lEWsk8B5Y=; b=VKekbQo5V2/aXyRVpSCbtxXVp
	wsqE0PH1HKf2Djm3R0siDeU+IAGRgGls51F4cSrOkFuJXOS4T+M/PEY6FbFu1hSif++9b/rGQgFVx
	JJChXOXsjm6Y669DeHWqPF7QWUgVbFqSNkFSzKEl6/mgmZPiZTmuMMiRbcbSivQVOSC4FxQ4tZZbJ
	bB1lMYSqqr+qP5TzcjrcNidha7EZXyzOE1C8WlJg3pLJm6NVdxZ0qRkArKmbpBv5md0TTbqbNZjLs
	ZjMqgkxXSFrhwYZNddqGBOQA3eAP658LxCdILbH6LZldwND9xz1dkLXNrx4iGEoE1UrLyLvN0HKz8
	mgFhvparQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0PR6-0007Ka-Ep; Fri, 15 Jan 2021 13:46:44 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0PR0-0007If-81; Fri, 15 Jan 2021 13:46:40 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10FDkUo0065901;
 Fri, 15 Jan 2021 07:46:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1610718390;
 bh=g7HD7ULQS09G7hiJfcw3OafibAomYsnv2U8SQHZGHIc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=xW7T/GF7QsCClzw6Zx567sx7J89omJ1Duf/wkPrh2oUf9nfCZLv9UFkW6mM5pMUZc
 4Gp07bB1wrq5d84zq9SZ8yTpA4s+Cvg+kgfX1Y8KFfLA+Ev9MiQz1ouBUlBQTAemBM
 CnbmLEn/Vf5rNrog3hk1xT0Dqu0zrk1Z13jlakio=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10FDkUOt006225
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 15 Jan 2021 07:46:30 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 Jan 2021 07:46:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 Jan 2021 07:46:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10FDkUpW124791;
 Fri, 15 Jan 2021 07:46:30 -0600
Date: Fri, 15 Jan 2021 07:46:28 -0600
From: Nishanth Menon <nm@ti.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v11 1/7] dt-bindings: soc: mediatek: add mtk svs
 dt-bindings
Message-ID: <20210115134628.nzayd3kn6wehkirh@enactment>
References: <20210107024356.583-1-roger.lu@mediatek.com>
 <20210107024356.583-2-roger.lu@mediatek.com>
 <20210112144727.GA321805@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112144727.GA321805@robh.at.kernel.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_084639_551681_8A37B0BF 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Angus Lin <Angus.Lin@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, linux-pm@vger.kernel.org,
 Roger Lu <roger.lu@mediatek.com>, linux-kernel@vger.kernel.org,
 HenryC Chen <HenryC.Chen@mediatek.com>, YT Lee <yt.lee@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Fan Chen <fan.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08:47-20210112, Rob Herring wrote:
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +  - Kevin Hilman <khilman@kernel.org>
> > +  - Nishanth Menon <nm@ti.com>
> 
> This should be someone that knows the h/w. Not who applies patches. 
> Perhaps you.

Yes please, I would have no idea what to do with SVS patches. Thanks Rob
for catching it.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
