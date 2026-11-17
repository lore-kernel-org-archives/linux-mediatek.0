Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33678606A338
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 19:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Btuzt2fL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zcg1M05H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=; b=Btuzt2fLQNKeKL8/8zhjFNC+Lf
	whItIfGaCck0K7YSwFxAust8hIc6wnxbKCrDmdo1CArhxNQnWiYZzgOlcdv+hO1YURz8twR8aFKOi
	yQlRmpg+nCYM7t6cWsMnH3sPVyiV4v7jLfBEZi0ZX3nWDu97u8apLHe6WttaK+wRftGnDdH06bH36
	/BKfG9TkZ8gK5WsV5QUbEZgkjwPGt3uvbfpn+dRfxibPpjiiNz2y+WMMfVvt61JBuUF9sJKhCtMqT
	hEXdmJ37jp+EXXJyPaPJz+RrRLr+Bm1PHpnLtenwU7ekBW4Lx8nemoIWsxuxBGJe3VCdldI4n3Hlw
	eERJ2KjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTObB-00000006pbN-0kbG;
	Tue, 17 Nov 2026 19:12:09 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOb7-00000006paK-0goi
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 19:12:07 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so304027a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 11:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794942723; cv=none;
        d=google.com; s=arc-20260327;
        b=YD0NYRrfG5xlxNmLIckgOEMy+H7yfKdqdOkmqMucvksGbHMXsmC/oHahI8rLMlgZcB
         yg+yUe8l1iRkJNIx1af0uF/XhWO46M0k2bpIK3yS9+8W8L32+j3ZMFnuGvI9uMPdh2J1
         asXvBzpAAPMAmAtN9Grxht6te4BlqU7ugX3bcBdPIevaqic39xjU+iOjC31TlhnwBIYA
         JImrlGR6Msf7V3kY4zzDb5DGj1z3Q/TslaY7hmG4hClk5gfz1vuXtxaajiK+cqn/3eHB
         lSpKrBmSgycfLIj58h0LDhvtx3PJO7Jxlr2eQdJCK0q1BqcIVGLgNK6lxqAp6ArSGHbj
         blYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        fh=i+a+a+3QcZdt0f6jheEZygfuVp1cz/vW2pjdxa9jxqQ=;
        b=TebolvQexKjEcG+KWi99e68DNDrknmSnUwAUVnvPMH2UUN04y9Ka9iIE0CB0kfZ8fF
         DdN/xzAtdCL4M9zgDCFlVMZni2GEQxfzr0djNhlggUwev3fZWcApZIuFFvUWS8ojSs9v
         Sxahw5U8j0TvP90a6soUoW610asWSTtPtY9b3jJ/vmua3QQhrLPZKQs54MbgzC0BrSID
         LYFUTKoMT3m8L0C2bwTtVwVUWZ1BQjNyxwtyTXfQRmO0vjgjUC6e0cC+Ev3r6wWNIN0Y
         UJh1FEL88spX4Va2JdvC1aCjpu10ZARzoWLGkyKvgWIVdREuoO+eixd/9xVNVIGqpf31
         vLdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942723; x=1795547523; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        b=Zcg1M05HUYXDtNS5hkvF65fcFQc5tqhpsOXlQa/Rd1aNYzaGyuTJEwQf0Q0tdeMZIx
         msShCAREP11nT4hTIB7pMk/zqIv5gNQf/eSg9N+UkPTlcT8xzp9TrxG6OyJNDIklNPVH
         SIWcYSXo0Iuilz5ih06f5KI0qjxWYS0gLC9EcaVkg8hbLLeeRs+tWBlcnD12tC92YIxl
         J3FUodyabfNPxlTxCYai+GBvN4c1wD0jgneO0UfNvVUFEoqRoIuJOvd7jqMEviv3UnD1
         VdguAagyyhxW7DMT8meA7NChuns7Ny8Cix74gX574ExoE++ewWRNDHbyl7kvwSS+MQwX
         ncUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942723; x=1795547523;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        b=VwPgr4uF9ZpA9PblAD5zMErjCxJ/C4BsPZJHq4OjF+SgXL2AE4zXg45HXUL3cqu2YP
         1r0F1nkmSo4KCMum4qTjJJhAXUt0dzSSAXHiv0uzauF8BZzV0dFBIMHYpjw1JQmPlS/x
         c2HjIVwF6pnC1wL5VZrd2Qm3D6uKmO98wdzb0SS4/bmGXmpx3qbJjFHBVgfdbJMW8kXp
         58cK779rjP2NaP5WK5PO06Q/DYvDgVZ0i3aAEjkATj6ofclGegMlAg93ZFX9O4KB9JXm
         ztd2djpmf2iy7Nbrwafb/jXg7UuepRxra1HE9+Y8XN6giAUCYUlZvPJxICo+xhVthzE4
         Hj7w==
X-Gm-Message-State: APuU4Z9hiiLOW/BzWQZk6X2H4DnIsyz51gkWpwkK7HLBFU58AR0I+mXb
	o+OcowRw+WqpAZSviUWQ8pgg6jxKxYbFG1Kj6y8nhoBdFRhV/xqjzAZNdeksozivRTs0wgPjY99
	9hFraIvTRqZjDdHW5HatX1taWNC3XZow=
X-Gm-Gg: AYBFou0W5yO1c5Guexlsgp7cOm/lObOrotP0dFTB9bqcODxKMFXVKazjjP+w9gEyn7F
	KH9cJSgvOTXDz6eArPXNJyWlrrpmU+JLxLbAIuaJQ7/HvXEJ4dVj0wiGlnlZoj0H8B5+/Ansfw5
	6+uoxfwKJ1W2xUDmaZ4VTedzfSK9nrD+RX2Ewn+ReA3e7Y0Ry8910Vc8X3fzhpa5uMcKNzSCHdU
	8XRSI0ESVF7Ltte5qxprzeq2z6sk43AJdu12iquXcfQAP3Y3y4/WnyUB+c6pxZ3QDZQy7c2Pr71
	i9tI7XKcFokkjjUiDd07zoxOwG/lj9h7ppiI5gAfEs99cxvlwq+vLNeQELLb3wkm88w8V0wQeSf
	G1kQtmcpVetcSLszaBKBkogyFTstZIFO6r6I=
X-Received: by 2002:a05:6402:2805:b0:6b8:7775:515b with SMTP id
 4fb4d7f45d1cf-6b887e52cc5mr201512a12.8.1794942722510; Tue, 17 Nov 2026
 11:12:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
 <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org> <CAORyz2+wF=VDTFkRFU7jBu-zNTW7T8mnPrJZAj8ZVD-Yyr2b6A@mail.gmail.com>
 <53298044-3595-4231-a498-d78052799727@kernel.org>
In-Reply-To: <53298044-3595-4231-a498-d78052799727@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Nov 2026 20:11:50 +0100
X-Gm-Features: AclHuK_tAaAmV8XPp2n_nIuVB_4g8FKHhKrmOBsZ4DZheY4_R5_9zza4TO_AcK8
Message-ID: <CAORyz2J9HrKr5JU1rigB7apEUpHg-P_ke=STWz-_sn64afqQgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111205_233960_2A7A1C8F 
X-CRM114-Status: GOOD (  13.01  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> bindings and DTS should be complete

Thank you for your patience, I understand now.

According to the current mediatek-drm code, aliases are not really
required unless there's multiple instances of the same block type [1].
On mt8167 this only happens for the dpi1 block and the rdma1 block. It
should be possible to introduce main display support without the
aliases with a couple of changes:

- rdma1 drives the secondary display pipeline; it can be omitted from
the DTS while still having the primary display pipeline work;
- dpi1 is used to drive HDMI output (not upstreamed yet). I can omit
it from the DTS for now, adding only the dpi0 node.

With this approach the DPI bindings would remain as submitted. Once an
appropriate mechanism to describe the blocks' indexing is in place
those two nodes can be reintroduced without having to change any other
component.
I have done a quick test on my devices and the approach seems to work.

Please let me know if you can see any issue with this idea, meanwhile
I'll run more rigorous device and DT tests.
Thank you for your help
--
Luca

[1] https://github.com/torvalds/linux/blob/666539eecdf4db623f5e3c3e55cf9f2dfad24aa4/drivers/gpu/drm/mediatek/mtk_ddp_comp.c#L566

