Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3303BC43602
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrZMujM7glJ2AgSACwXIbeDVc0Wnvusn0xlE1OdCrOs=; b=yn3vkg1uk5QRTKYEbUS9kAkvsZ
	3sKpPfBKGt96TLzJkKbuWUKOeA6xQpA6EwNrpXPjQzbQvv7loyOuOspQbZKYXTRI6EUZmfhv7NKaZ
	FSq5StotPoXfQIh78sewXkI2Tqt9d/Ru1iA9KAttEeAobxiRV6Krn6CwSkJMtNRaMYdlUleyEsHJp
	KLc5CnToBmxu0isKud0YC9Af/kQvX6dYvWVjIiFdnNek5uOqK2jgHCNWzjb1oC1QMT64dkZQB4oWS
	qVx9iLGFXuZixFl80RA97QKSC91wsKuNkVbPsQRrWVnz5xKMAGC/jLNW+Q2D36+y83wzCiNT27E3N
	xRaSTlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh75Z-0000000FCgw-0QKI;
	Tue, 07 Jul 2026 14:47:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh75X-0000000FCfu-09fX
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 14:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WrZMujM7glJ2AgSACwXIbeDVc0Wnvusn0xlE1OdCrOs=;
	b=EKl42bNbEGgXwwJD7csRZ95i+BuoSiFybJ5zQD468o0cAnfNe2Wv/5QCdHaFPuKv5pbl5j
	1s9YgmlnbdIwroTjHdCNJJXLPZg1igLpBNz3nJruWyBZjfSh2fLQyV38AeK4cpCktJvC1G
	uhfwhUQPet10Bvf/eQBIDGlJzb2E3qo=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-830wUw7-PG-QlIcQL0Vq3Q-1; Tue, 07 Jul 2026 10:47:53 -0400
X-MC-Unique: 830wUw7-PG-QlIcQL0Vq3Q-1
X-Mimecast-MFC-AGG-ID: 830wUw7-PG-QlIcQL0Vq3Q_1783435673
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a177de7766so2346913eaf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 07:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435672; x=1784040472;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrZMujM7glJ2AgSACwXIbeDVc0Wnvusn0xlE1OdCrOs=;
        b=SPemi20SREcp74qC5e5Qo/GjlQ8A/4qUAnqPFn6upfjtuTM85kZba6MbwbbpfJyuyV
         VxYJBS+cyNwETErRedya/QhV9J8w0lXBVsL3qfNeOv6j0G2+hGz43eJrOMw3AnxiEUAT
         vXcIqEVmgRnxNu7n13g/V+kApoy976X/GfsaHa9EFN0ZZnCzFgHS+rAtRGZgEFk1Y4bf
         ukrR0iyXNby8LGN5GiI9+d8ND6MT3zQDLNjy9ptCXZkB4olf5EFCGWmEXMlgTe+3KKQT
         JorAP2jUR/gjCDKCfU42U7YseDdjrYj9UO01+D82c1lw+q3JTmpWoNQLOYzIrptP+7YU
         mBPg==
X-Forwarded-Encrypted: i=1; AFNElJ/fVE0KZH9iJhjkhyezb4N7gjT+qIKQMhQvuIT2NogNp1As0j6zVYDmSE0WJCKAkO0eSLTw9nXQ9oJh+PY/Jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTSwRExVkP/yMDoIX6rVsLZoc5BDatpmkPP1StTW4Y+WUTDK9t
	PyXM015sGr2FGzzrVQ/9feV3UPUYtk2XZsSxenuiGmtcUROqRw4d0Ld/U9Pei6B/7jg0qp65zc5
	lVgYHdPi7fAfnaQjkoERnQTsDKx8CMtLlfgBB9Gjs9DY9ShBQ3/QTcbuQ3RLFM71twcEId/LPrg
	==
X-Gm-Gg: AfdE7cnvlh8jMqnNfQOLP4ufY625JnmwDh67o7ltSwedpmYbit4BHQnudpudbKDdK8+
	E1/Ce7eEj1wW2ac82hwExAA6o3XMNuEh0CpPuoQ4gYNEpjST8Z0V+qEe1nP9me149dOIprMUMFX
	le+0kxaPKDwlLC3zs7E3eIpI98uVpt/GZ0WnIA6Trkx9Il0/gGA7Oogl5qrlKN1Ji3rd61C+wN9
	HTrZRq/liy/7iHXblnaw/tgS5g/88xngE12A1J1l0D/vjAjSRn07jQV+MxeeHcOHnsRUmJSMjHl
	YFUvMORK5xzJ6Fvr6WXJ3kpbT0oJjaDhhP5MQnxMkdULsbCwBxaHphH29AGZKPJqsm6ZxVFoRZ3
	GtSwuqcLZ
X-Received: by 2002:a05:6820:818b:b0:6a1:87cb:c34e with SMTP id 006d021491bc7-6a3555125fdmr3682610eaf.72.1783435672519;
        Tue, 07 Jul 2026 07:47:52 -0700 (PDT)
X-Received: by 2002:a05:6820:818b:b0:6a1:87cb:c34e with SMTP id 006d021491bc7-6a3555125fdmr3682515eaf.72.1783435669460;
        Tue, 07 Jul 2026 07:47:49 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a30ff8e0a0sm11018754eaf.3.2026.07.07.07.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:48 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:47:44 -0400
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
Subject: Re: [PATCH v2 3/6] clk: mediatek: mt7622: fix memory leak on module
 removal
Message-ID: <ak0RkDJr1FO0BCoV@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-4-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-4-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wok64mo4NcsHwIWn1CItbl-Jz2vuhIiCZp9SW918onw_1783435673
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_074755_148241_706AEBFE 
X-CRM114-Status: GOOD (  11.54  )
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

On Tue, Jul 07, 2026 at 04:48:32PM +0900, Akari Tsuyukusa wrote:
> clk-mt7622-apmixedsys.c and clk-mt7622-infracfg.c do not call
> platform_set_drvdata() during their driver probe callback,
> but their remove callback calls platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
> Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


