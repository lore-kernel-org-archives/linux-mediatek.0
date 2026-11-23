Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E189606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 09:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2qYmAgwR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gWSAeKvp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Fw/YKdGx/bEJxv6m8dJuQDKu0hTKbF1u6pYTLgihK3c=; b=2qYmAgwR7aJPMCcvgSBxbNOk/h
	g89Nv+yruykq2fE24+0fay0Vo8EIn/GSlmqasxo7XqbtSvWpaGiXz/+8D44aoyJuw1CkFsfwFvXsG
	0DRZHcyj+SI0cdoKgKZXjRMBzWKC3+/LUxbyUiVo0G6Dlr9VL5wi9vRoHAhLyGW/XorZmeN9L30se
	4RlINgrC8Ng7S/NPLSedAoaO2Hs+xMyosB5s3okLz/KIHxvGPKWgNjyHbLxFdzIkY7CLTIyP4kOxj
	re+N2x+TurFLnm2xfG95kGYo7x06qwA5sukoydlpjgTB1zRnzkJDJuhT0RCQ2hScJS2LDc6GRzL24
	5tC3ld0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPuA-00000002dNT-2v69;
	Mon, 23 Nov 2026 09:00:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPtH-00000002cy3-1aGP
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 08:59:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28273185e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 00:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424333; x=1796029133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fw/YKdGx/bEJxv6m8dJuQDKu0hTKbF1u6pYTLgihK3c=;
        b=gWSAeKvpDHH+cvnLEqY7Jn/uMVcEj8B3tQe+j6/PUgLSCAQfOthGa4+6CW3jZs6kr/
         KMe14lhRyR9NId7mUPv3/3zk7fbEVGEIKhLiyPIblP6TBfWqITlEdUNiT4ROY8pmgOcf
         1lnNErEezxAm9/n6DZUUWND/K1E9WAaZiokSR+HPocJ5eNG2BT5BKCHmI3CAcx2DW857
         38ZcQZJDxW07jXYOaEwyyKGlk8ryC2+oh1LnfxEnC9m3SniFhoWXvvp9hr3s647M7QyI
         xClbsuR+AMv6iEH+eGSB6YmFLtiRQeDmrN6oSc/+uj158OTyrRSSeFh1RRlqy+t0t0FC
         FSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424333; x=1796029133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fw/YKdGx/bEJxv6m8dJuQDKu0hTKbF1u6pYTLgihK3c=;
        b=kWtkMJEVc2vfRmO7uDGsfxssaLWGMFIiwUyXZSV8Dt/OJ0YtjGgiSgJVvBwrrurAQR
         /Ueru2Gx4ZZQcpcFWNWr+ABq4G1G3auxsOTQqdYC4kmLWTw8VXWurFanbCeom5F+25OG
         Gy9C+GkyY4/ub/nNiJ3jTqKVM8GfEabEpXppQ93s9yJNWf4Hi/DOMIV+EVY39Jdst+7a
         Y6Cpft96YiwkSm2/8cdLOhF8/GkWk4s1qf1gx5WIXBXeGZMpiXE1hl0Owi2CvBkFTYm3
         OthuG869SsXhye6LWEE6AASH+Epy0nxiXXIoV0n4eImkwzMzVrfQ+10uCyRUmswtztuR
         WQ2g==
X-Gm-Message-State: APuU4Z8aZoBNDCa6ZjMpi3TLJ5OGa3P4YcnX/bQXrwBwWGsomgx8z0NU
	2StcLtwndm9yt6BPaLVYeWlOKdDaCyBFid88u3He1OrYpMPaUMoF/gbR+kaYAPwyUFo=
X-Gm-Gg: AZFdTZdxMuczjDvxa7D8R1aDjRNhY67VH6T+/gYTpGzjrcUVFf4RWbeIkjoIsgw6FRj
	Rw1O5Ypyy/Ve5Ek/ck+CRHQrlFBH7U7WFgueZJH9AYU4pExp4QW6zCrI+fBX0h8MG9r9f3b5uBq
	0ABuhMop1YRkvjx5L5XXVLsDOM423XJ/cDpJ65bnwrGQts/2NaF3+lo6Wse/EWijM2AuqZTmBW1
	TzL60hkAvb1je/34MoK9xOEhWKBsG09e7IvQq5HOgy8hwPJrspBkh2WhkA+EV33VtqDmfQWfwgt
	DQCc7zrEOi6lopwWahBMS3Pz9hSNVKXS3hLFzBRb+NvAXy34S1/WZ7/mHlJCAnr3KtKwhJnuIgt
	fIcv998wgPp9UOOh+ps487JeFp7xh9JgwN5CQhbH11B3V2UUS6CoCYeeAWQmqNZHqxRBetBKmXq
	qciVvKa7v1yz9RiRB2ttjq3chcJb4Fih93F/RgncdIAdiJ38/H0yW33cA4Js8sUXZbDhfVS2lf0
	f4Gu+oKhje6txaYmfOrsCQcXW4fduq6no949/dRUekWkpWzutUDL7Dis3ldqzZLNK9GPOcMjB2l
	0fcr5EYfUvOZvmiFPBxfA7hvFw==
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr217464265e9.10.1795424332866;
        Mon, 23 Nov 2026 00:58:52 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm375960755e9.12.2026.11.23.00.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:58:52 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] arm64: dts: mediatek: mt8167: Add DRM nodes
Date: Mon, 23 Nov 2026 09:57:53 +0100
Message-ID: <20261123085840.8687-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005915_288626_5D1A07C3 
X-CRM114-Status: GOOD (  13.36  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the main display pipeline on the MediaTek
mt8167 SoC.

The driver bits have already been applied in CK Hu drm-next branch,
together with the first patch of this series regarding the DPI block DT
binding. I am including the latter again in this series because it was
un-acked by DT maintainers last week due to the addition of un-documented
alias section [1]. Those aliases are currently required by the driver to
drive the secondary (external) display pipeline, but the main display
pipeline does not require them and they can be safely omitted.

In version v2 I removed the nodes related to the secondary display pipeline
to add display support for 90% of the devices that only use the main
display pipeline while an acceptable alternative to aliases is devised.

The series has been tested on Xiaomi Mi Smart Clock (X04G), Lenovo Smart
Clock 2 (CD-24502F), Lenovo Tab Essential 7 (TB-7104F).

Changes in v2:
- Removed the secondary pipeline nodes (rdma1, dpi1);
- Removed the aliases block;
- Implemented the complete OF graph for the main pipeline, using the same
  path that is currently hardcoded fallback in DRM driver code (output to
  DSI display). This improves backward compatibility for the upstream
  mt8167 Pumpkin board.

v1: [2]

[1] https://lore.kernel.org/linux-mediatek/bbefcf0b-b31e-4f74-bf79-b0ccc983f62b@kernel.org/
[2] https://lore.kernel.org/linux-mediatek/20261117122802.728987-1-l.scorcia@gmail.com/

Luca Leonardo Scorcia (2):
  dt-bindings: display: mediatek: dpi: Add compatible for mt8167
  arm64: dts: mediatek: mt8167: Add DRM nodes for primary display path

 .../display/mediatek/mediatek,dpi.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 297 ++++++++++++++++++
 2 files changed, 298 insertions(+)

-- 
2.43.0


