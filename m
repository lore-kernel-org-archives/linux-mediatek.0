Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCF2C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 02:12:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AB8820734
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 02:12:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x2TVkeaj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AB8820734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eg2gQawVKyOo8yorUApELOFo2U8NuVCwv0XvV6lqbZw=; b=x2TVkeajzIB8iSH6oYSXUcvkm
	B8EoDEOlLP4b/g4kp1HeHeoN8P3BqAVOPxh7PPN81Tv3sa+ihfIXTLhnnq2kQ2R1okjQnOGfnHcI5
	CfVB5fTGrGhkvdQkqteq9w2TK0+34AwDiL1BB1yGTIvLqSatjIS+5VyuRir8Wi8iLp9ubtFgX1Dyv
	bagM1/5834zkK9llX+opS+i0MefyzY1onw0OLuKD9xtOnMv/rWPYfVKbmWmh2nji7L1s4B+bPOd5W
	FVXN2uum8meL00jIMH7c2w8OXtfPwiCurQoxHqKUcR4HIh/kB3fLn8uh/0TCjc7dyaVRxf6WDEO+5
	tnxFLvHVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxhlq-0000kv-45; Tue, 21 Jul 2020 02:12:42 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxhlo-0000kN-0N; Tue, 21 Jul 2020 02:12:40 +0000
Received: by mail-il1-f196.google.com with SMTP id o3so15046347ilo.12;
 Mon, 20 Jul 2020 19:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i0xPj1Ho5fgI9khsratqKQQfk1V9sIVhizjOEkVa748=;
 b=DO/DsEpbaxDkCWatTAerqpQQZf0VXqtmcrBES+gRY/1XrG/770tDFcuoFZwAbXpYfl
 QoZgiBDatBMKFxGWcIJ2/kDLPQicfqQ2bSSRY1vZOs5Ioo7QW5cAuMgVanXb+3FeJYGQ
 3gdO+4E+Rqn+6p3UkT4bvgCUUb1X6xYGef6gIZVh4xOesvHsSxluiVNlMXGPT5S/3d8l
 pICxFnsLjVbLTfo55Jc1aRCSsh27yB8NHHpqeaxp8vE10HwYwh4oAmJqmeii+pA1fwik
 e/YyLdnsphebPj2/YNREu44ucCYPspbH3hZjuIBiHU8G5ONJFbFuBKcIY/lm6UGgf79q
 7SbA==
X-Gm-Message-State: AOAM533zz1IOuu55mGn7/KJMpFsrN305N//kpmPWl3/pB4d+KVf5XJL9
 MPZhEEIuZ0s7+vd2sxBcuxuxGzul2A==
X-Google-Smtp-Source: ABdhPJxc5qAtpL5dkkvN8ISGEBQRIsmkLgRH1g0yx9Vu3KumL5n3keb5UonNgQK+wNW9RJA4XJh0eQ==
X-Received: by 2002:a92:bd0f:: with SMTP id c15mr24981493ile.95.1595297559165; 
 Mon, 20 Jul 2020 19:12:39 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id b2sm9841835ilf.0.2020.07.20.19.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 19:12:38 -0700 (PDT)
Received: (nullmailer pid 3391247 invoked by uid 1000);
 Tue, 21 Jul 2020 02:12:37 -0000
Date: Mon, 20 Jul 2020 20:12:37 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 2/3] dt-bindings: mediatek: add compatible for
 MT6873/8192 pwrap
Message-ID: <20200721021237.GA3391199@bogus>
References: <1594720432-19586-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1594720432-19586-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594720432-19586-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_221240_054633_A8132D9A 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: devicetree@vger.kernel.org, Argus Lin <argus.lin@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 14 Jul 2020 17:53:51 +0800, Hsin-Hsiung Wang wrote:
> This adds dt-binding documentation of pwrap for Mediatek MT6873/8192
> SoCs Platform.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
