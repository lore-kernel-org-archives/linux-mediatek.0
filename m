Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D04BC43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Drq9IO910KDKJg6IREG7IQQKNNio5SvfjReuxq/0qk0=; b=AHpzInBZTy9l32KKAJHiAv2XHm
	c0mmkU0+kpTLDgisXVlJLPO3qbuq4b1WtI+/1gx0YoCVnAVpHs5Cx1nBY4f0n9S9ZtZPfUaX2OEOo
	/N2orjdQOASeRTiAXgsG3uz05TDfRH7gVAlijRlgaBl4QOg65uS/+g6/2NmbPdSc6QqnrCrc3TkUV
	VLA7Cu7yyOFZeagiUqoXd+ITagb+HzFOTgx0TdytIAh7Bo/o1ve/RXV662EEddL3z8/+kQjOqA2Y3
	JzYHKO6udwIHcNVZQYaSUOrhGVYuWF0Fu70jv3J6XUGe8dnHTnBUoDDVRE+k5YBO4VBPHiqP7GLNI
	z/98UBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh76G-0000000FCxL-2DSV;
	Tue, 07 Jul 2026 14:48:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh76E-0000000FCw5-3Ojg
	for linux-mediatek@bombadil.infradead.org;
	Tue, 07 Jul 2026 14:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Drq9IO910KDKJg6IREG7IQQKNNio5SvfjReuxq/0qk0=; b=QAQaoFsSucw/YPYRJe4J+DXO57
	i2Al6LhrToBp5pAGnUcgOBRvvsCWskwb1++kbBgL/HYm6coguKuA95zKcnldjHLvWLwouHH5WT+/x
	lME7o6+BVedQVmKNq6YMJnkwvLyZIKgpMjIRPDQc6mkyUJH8/9UkeLWjNGaKBfJtAGpcULaJ1rKLn
	zv0BCeLgfEJJBdB0DMzdtFIg+titq78a3GyBnIFmUUqukGuu7i0A/MQHZw8XLmjmo0KSuiDwMWRgI
	4d6u7GpSA7BbseLRmdyMnwGQrgVHpKVGaFaeKmJufUYKUB4p71v+L9xUshfAPdRegfyJnkgiKlRZI
	XlyCi58A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wh76B-00000007ZGC-1yMl
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 14:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Drq9IO910KDKJg6IREG7IQQKNNio5SvfjReuxq/0qk0=;
	b=bP1O1QiL9ImBalx1GlpVDq7PitwHeYA16z9vHwhsehClLAKenlDXm1KpoQ9CmFn79gikUR
	CHupu+7E75NNQTgSLnW1TYFoB5/hJ6HtgeDQCidYt1zw/JZtcbkKw6aBcNA0yYCQpnl1lG
	KYTw1hzNrO11t3w1q6Rt5pqbtCmdOmU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Drq9IO910KDKJg6IREG7IQQKNNio5SvfjReuxq/0qk0=;
	b=bP1O1QiL9ImBalx1GlpVDq7PitwHeYA16z9vHwhsehClLAKenlDXm1KpoQ9CmFn79gikUR
	CHupu+7E75NNQTgSLnW1TYFoB5/hJ6HtgeDQCidYt1zw/JZtcbkKw6aBcNA0yYCQpnl1lG
	KYTw1hzNrO11t3w1q6Rt5pqbtCmdOmU=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-cuplJMNbOziiIkxZVZBdmQ-1; Tue, 07 Jul 2026 10:48:30 -0400
X-MC-Unique: cuplJMNbOziiIkxZVZBdmQ-1
X-Mimecast-MFC-AGG-ID: cuplJMNbOziiIkxZVZBdmQ_1783435709
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb711362a2so2909085a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 07:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435709; x=1784040509;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Drq9IO910KDKJg6IREG7IQQKNNio5SvfjReuxq/0qk0=;
        b=kqNtaBCxfRa7bQeog3jsqZ6UJKtSlvMy/fnhdkc5O7SgjAC9UtKPAwVQHbCT+bGVsx
         6W/ccEbyOQwl9QFiQ1g67yEZI/1wYs97JKFNubvLT4wcBgfEPEEjHYEnJTomDKJsdQes
         z5Hltdv8aJPCnvD064KnyAV0vOKLJI9gzVOzzROiGP5szNburLxjkpwFecb5RvYgIAS+
         inrjr6LO4LObtGViLPbT4FQkhfwbRIK3MNdPFADLLL/9iDzjmUV25WtYjK/xZ/R8kXhi
         9/r/n5cVY89JyqOb30qJEl827hL54vdsx4BPG3cIYrvsprP0oKg4K1re6xtrqxTSoUn2
         bO8g==
X-Forwarded-Encrypted: i=1; AFNElJ/hM3KAti8cb3NyaSTG/ef3h1D/ZVXRCBnabxXHnfwv26uVhtOwDa/18SY8WcXnhn+E45zlxHF/gktvdJE8bg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyH2VLUJGJyFPXS+wACzejg6RJdjacaJUansFtTeU5MlDJD/eFX
	9G8uvBzLQruEPqzDYv6qTJhKySG9N2CvmzLuaSAEEaVOvRiJPfUA9mrR5gSOGI84Wem4zSHeZb2
	xpPHBbQWcXI5uEJHCtRkao99MTUp6MwfxXqTIWsJ+hEd7OJPWXY0GSFhXW3ZPTwbMWj6/3pN/JA
	==
X-Gm-Gg: AfdE7ckutUEIl7aFK98A61xAVTON3Y61psRObYuBAv2lDMvX6SZeGeNRWpGYJ71PVB0
	By5FDG/NupMVHUBhNsmUDWjVSfXMraCS6XLJddd0DQwDyTckgtjNrroEnOl88ustJpbH+4FR79+
	Eqrnbxebqiac4MvYmhte+x2N4DzmyAYs3s/3wegNEm+1iaCM7lcVJ/kkkg56teU8kqYz59B6YWS
	56A60Zc2CBOvY0aXiLY19Ybhx7jq5NafzXLxRFyL0PoyLtIwnfEV1+FoFhfKxyKe98iTo3XzXkM
	X7fxUyvZNf2r6iyxNS0hL1MR0NsVi/BmqT278d/eO4vH/A90+WApM5EaeI8Gyo7m+cafXJ2TLnl
	pdWKrTrTn
X-Received: by 2002:a05:6830:660a:b0:7e9:f0e6:fd55 with SMTP id 46e09a7af769-7ebb239d6a4mr3693044a34.30.1783435708966;
        Tue, 07 Jul 2026 07:48:28 -0700 (PDT)
X-Received: by 2002:a05:6830:660a:b0:7e9:f0e6:fd55 with SMTP id 46e09a7af769-7ebb239d6a4mr3693021a34.30.1783435708164;
        Tue, 07 Jul 2026 07:48:28 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542936e6sm14104096a34.5.2026.07.07.07.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:48:27 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:48:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module
 removal
Message-ID: <ak0RuP-Gy29fpPVi@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-6-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-6-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yVRHVpzvUagdk7ioHvSfWiiUMXwXn8-xXiOFwXQoC1Y_1783435709
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_154835_733005_9252F512 
X-CRM114-Status: GOOD (  11.72  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 07, 2026 at 04:48:34PM +0900, Akari Tsuyukusa wrote:
> clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
> platform_set_drvdata() during their driver probe callback,
> but their remove callback calls platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


