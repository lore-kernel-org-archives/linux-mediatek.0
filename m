Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D303FCA9ED0
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 02:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ePY+63uYRMrFDWAptdadiuSJ2ZP+/koDWoDpXgbL1M=; b=B/D8YgsPmFotwNJOZN233r/bE+
	39/lUxiDPYvd8mJ8FcOsdN+seKgC8hO70G5R8lr4pEaYWMlsi8e1OZZ2bWfQGAG0IRtGMgf9YFzwj
	hG1PPcvo0X0YERRBYc6k8t986BILaM2WbOTwprXXBQcSd46/372zQrhCI7ZvbuQ0as5wcIFKTA5zN
	iZSz9g6Z7HBre+aYxZpzNWEhH9sYW+JJYgVU++IEXaxSzIrIKuzH/+gFWXqB2IcjZp2MB4cP03uMS
	3EZjIOKH2emKYU6hWmk57RsRigu2NwnVC7TenfL5We4fIBXKYPnIX5NPPpQXXko2No0ivPJZMdbzO
	RBi1KXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSJk-0000000BoC8-2ZsI;
	Tue, 13 Oct 2026 02:32:40 +0000
Received: from mail-qv2-x02.google.com ([2607:f8b0:4864:33::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSJh-0000000BoAK-1bQ6
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 02:32:39 +0000
Received: by mail-qv2-x02.google.com with SMTP id 6a1803df08f44-91b851030dcso6363406d6.0
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Oct 2026 19:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791858755; x=1792463555; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ePY+63uYRMrFDWAptdadiuSJ2ZP+/koDWoDpXgbL1M=;
        b=gRgzfueBlnNkFm1aXuqYWjwL/b3/o6D4yC7K161NHHSpjuOP8XBukiT4RtOHeKlhHE
         6/ZHNLAOp+kIERdPlz7gm+A+6Z8PeTvAuf9FGtmnkPtwHZH91b5QQDGTrZQfN8USf43r
         3vL+0dep4My7VlGr8b62KDQKR16C7vxQeboq6hV8urDSqtRArkgNDZDY7PGfteUW2Q0Y
         vfQRM8kLmL96IHLLbRAmputxcXr79bOZ8Go7UIqKRlA/XXKyoVBIiT2zVfyU93UZsAmQ
         b1frAiLnenbq7OGIUP8D3sjLWkL2h4KgwJ0HKtbQvheTt4YKLm5//ZND2M0ebTYNTNi7
         teYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791858755; x=1792463555;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ePY+63uYRMrFDWAptdadiuSJ2ZP+/koDWoDpXgbL1M=;
        b=Q8lt1xQdcaRbgGkRGdmtmrIw+hxcP3KDMH2sePnphNA8ALinRUbNLMBnldDyCggqbq
         1RH9LCl5OrMjcRsi+m8x45xOhkIwxB2oa1HZx1uTD16+QI9jopkILpsT5sq8h3w+TewI
         HSXwcOS51p/oar/L2C+ql9qSjzBGlVtE7HUPeoAzeM/qcTVIoFIMqHo+9FENgiAmBkns
         ojBgD8ocHgydMYZc21mdozpOH1zK1qeV7/OZikIDfaszzXRx4XJSC7FU/mh1fqITekb3
         TVcXa4Qa62PZF+SyeqX7H0WyzWnErMewXwpDl1r1YNZcdV+l94KBL1TN5ucT9h8ditac
         tgaA==
X-Forwarded-Encrypted: i=1; AKwUvBz5Wjq1Tg8tYrHy4G4U3i1ztfmbDgTDF2Ue+yD6Pz+L8NMCKpiSp0LS2cdH0/MYiI1cCOeS+Kh8eUtdRJ9f3g==@lists.infradead.org
X-Gm-Message-State: AFq9FYIG+ZuQ+KvkbuWYhPLJV2dI/bDF34w5/J/2E518zBne6eLYXRTq
	+W/d+J4nLiEkLdka9wzo7/kXMRtXYjsIyJvArhKeGWW8I9kHG5rC9XRm
X-Gm-Gg: AYBFou2GZq32iwuQyA3D92ZYaaG5CHnxxXErpmskJZmsisU8GYKEfflYZX7YwiVxzkB
	UbPvkH1/acCVK60WZsUA3FwEjGQ60NDrgpAaxDT9Qnh7OQKrbKDRXMBPhcJG5v2ZsUGZkg+S4T4
	Aagb4LeZ6oPToW3R/qtl+e2bjUWrMSxWdgCRoWwyBgGpfnxfJVcpWyvj6sFqn7Prua9f30dk7tn
	F52Q8+Ik4XJd/amVtcM5JZW4WqIGEXD4vjdduMvqWawEMAwNPDpEJYNtN8Pdg8prZWPCcSvvPqp
	temQp9Jyh5mUrRPX1WsVdHaS3aDCWF6aEd2PYGakazgd2NOBow5iX0HaV23En5kUAyazTYwXP9e
	QpRkUsw0Mf6GXVVp9IjZ60gScF4dMI8hP03+aQQIEcvAiNnoxWScSvJwkU2WbfOPpJGGl6+WxIt
	gErKBQJ7Fmvp+pMYi+1M+udgUjNmNlXwDQXzgbIUfTxJJcEZciP3HqkDs9DzEGuZhwrMMvS/9sn
	ySd7VI=
X-Received: by 2002:a05:620a:4552:b0:93c:6abf:c8ae with SMTP id af79cd13be357-93ebd231201mr1979508485a.50.1791858755323;
        Mon, 12 Oct 2026 19:32:35 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:8019:c46c:3784:400f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef500973asm134755585a.15.2026.10.12.19.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:32:34 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 0/6] AFBC fixes for MediaTek DRM
Date: Mon, 12 Oct 2026 22:32:22 -0400
Message-ID: <20261013023224.2195490-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cc128facb246d89408cf46aa7c9e250c56900940.camel@collabora.com>
References: <cc128facb246d89408cf46aa7c9e250c56900940.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_193237_431802_63B3D63D 
X-CRM114-Status: GOOD (  18.47  )
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

Hi Nícolas,

On Fri, Jan 9, 2026, Nícolas F. R. A. Prado wrote:
> I received a suggestion that the Lx_2ND_SUBBUF bit in OVL is not needed
> when cropping is not enabled, and that removing it should fix the extra
> pixels after the image described in 2.a., and perhaps even fix AFBC not
> working with MT8188, though I haven't had time to test it.

I tried this on an MT8189 Chromebook (Lenovo IdeaPad Slim 3 Chromebook,
board "quigon" of the skywalker family), and the suggestion holds there.

Setup: next-20261008 with the posted MT8189 display series and this
board's DT, plus patches 1-4 and 6 of this RFC (5 is MT8188-only; the
MT8189 OVL uses the MT8195 data). AFBC announced on OVL0 only, which
drives the internal 1920x1200 eDP panel. Mesa 26.2.4 Panfrost
(Mali-G57), Hyprland. The compositor picked AFBC 32x8|SPLIT|SPARSE for
both the 1920x1200 primary plane and the 512x512 cursor plane.

With the series as posted, I see what you list as 2.a: the top 4 rows
are missing, and stray pixels show up after the image (here right below
the cursor, on the cursor plane). On top of that, the IOMMU reports read
faults from the display side while AFBC layers are on:

  mtk-iommu 1e802000.iommu: fault type=0x5 iova=0xfad06000 pa=0x0 master=0x21810410(larb=1 port=4) layer=1 read

(always larb 1 port 4, two different iovas, presumably one per plane)

With OVL_PITCH_MSB_2ND_SUBBUF left out of DISP_REG_OVL_PITCH_MSB for
these layers, the picture is correct (nothing missing at the top, no
stray pixels) and there are no faults. I made the bit switchable at
runtime to check that it is the cause: with the bit off, 0 faults in
30 s; set again, 20 faults in the next 10 s and the artifacts are back;
off again, the faults stop once both planes have been updated.

What I run now sets it only when the layer is cropped, going by the
suggestion:

	bool cropped = pending->clip_left || pending->clip_right ||
		       pending->clip_top || pending->clip_bottom;

	mtk_ddp_write_relaxed(cmdq_pkt,
			      (cropped ? OVL_PITCH_MSB_2ND_SUBBUF : 0) | pitch_msb,
			      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));

I haven't been able to exercise a cropped AFBC layer here (the
compositor only uses full-screen and cursor planes), so I can't say
whether the bit is right in that case. I also haven't tried the
resolutions from 2.b/2.c or the external pipeline (OVL1).

I can test a v2 on MT8189. The board's patches and notes are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy

The testing was done with help from an AI assistant (Claude).

Thanks,
zoan37

