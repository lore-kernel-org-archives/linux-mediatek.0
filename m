Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5A560A383D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wNipNx9k;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OTPW0OpI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=; b=wNipNx9kBFpuKSO6K6JHrsrmJa
	iUF6wC8rbqdVu8B2u1enJuYvSgr8q0T2mUQTxHhbQZVAgj2Jyq6dwnJW9MdIufDqG7us3gE7DbqLD
	dEH2R/4mTVGQWwHT9XZCFaY1PHIwKciV+HuKd180pqOyZu3qQwB2kFp59sm8hJaZBvfcSeI0Djz5r
	A1TD0K5SuzDvqv9suhEhoDKjcSohpUYQK6Jnt1JIyZRTTXD9iUR1CGyJdzCjjqPwnwTJukvyzGiDM
	M/7Vob32dXGr25fpQeWpCRFL/M8COPIRidE1+16FmGtzPXqssGXPxyhuwXTVZPNO3/+NObzK/Wats
	RkHUXc0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSV-000000029IG-3pCi;
	Mon, 26 Oct 2026 09:57:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHST-000000029Fs-34D8
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so15383075e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008655; x=1793613455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=;
        b=OTPW0OpIze2z1aHjHVMEolCe+3UFfMVcqZ8QI7EOaKYGocbES7TPVcmapXQUC4ZF01
         uqa5egcWzYQEDDy88hH/o8CgsARwfRxs+OPPLZ/BjuXq7r7N/be0MuqEwxBb9rpfnncK
         vtvbI7LN5YYO0fduEn7fe4WStFGHBJMGvzJthUXyh4vXFgaEoWZt4P7Wm/urRkllQAqJ
         vdWT4KvOZA/OX0j6Hkwykxw32hpbx4PTVFtzCSFzwR9L3lOHUT5rcGBZyna++JVwSaqB
         hE99ZAluEk36hI0Tx2Em12JOnK4QQ+a70HyDTGz3n3rl5xPmOVR/z6ZQ+fghCBsx2AmJ
         lQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008655; x=1793613455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R9h+DEGkE7OfbxbTlOhlkSwyAQZZrV9VsqfeUYO7TCM=;
        b=QguQtnO+p5E8ke9HELJBdMTD/GeXbpLAov30F7aokkwNydMNed4wbFU6uqRK6XPreQ
         /T2TP6Qg/oyAZIS5PLhsyUSfwxVNXtmVVENI9jfT+wQneKtoQqCGbi13kc1Y/U6hps5C
         m96W/gcOcpKyeeB0Rd1FzLNyk+5+8wbt+ZZl/e5CgUM4kzPcTlMNnIT0tkmqlEaZ+gtU
         Kr4IuIys/pjWrvNlBO3/jwWQMBCkGO79gbOQoW1YBQ/sXOOvJ+jo6N+PfB+DzskPG4m1
         R0Cuk1jzXEY+FnPqC98lkyRr3aLORpEi/0RAyAuvaOJ1GFojbHa6H/5b6I6P9We5cXZ2
         lvmA==
X-Forwarded-Encrypted: i=1; AKwUvBzWQRDwbb61J7/Sw5WjNsjS9S/WWRExd6HzfFvlU3YhOkuy01pmrtiepQTGt+kbzhVZUqDmkb14rLpMhiAV1Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYK6iwS3Dz+62vHIu0WsTX0IYr+DXl44WzwDSRvaGp3gqkDK9y9H
	lRBRIgpo/q2rczpc2F9UBoFzY9nlrUPpzbeVXMZpbe5Ow+AuCd1xuZiH
X-Gm-Gg: AYBFou3AvqxP6mRGhscIIhJTI0TIsb1DnsYq84+fAyBA4YVDAyDsT/OrAPGPCUlv2bs
	9MLNZfKlVBABYmjEC+Htz/nTnfYzrv5D0QQ6GS707WD3woacwj9vMH7XYeqC2mjUDG3JJcmsqdg
	SIL1Elqc5MHIvEXIjcwM7D93fK1HFLxkbmz/wOFX39eHKfnbJveVB/ATcvfdzwXr5360EyxGcyM
	+9dWmzCESzHOCEesj1NrrfXEMXmNMASXBIOkV0p6iwDiUsZFboMdDA9EAkIqNJdc3e3uV01RbO4
	EmQH+k8xR6pbUE2+Sv3PuCfmw+B26Hx7a9e8VV5ZxireqcpGLyip+U/zT1lJPIWJMRNDD6YXjto
	vuvVK7qNjsiyHyKRduqxCRQI5CaA3KAyCQywIAjjOLXUq+MQTq0ImA5gmLDZoVmtJdLK4BDBV87
	3Mob8HBTmf7B9snxthr+nWrNZxtZH24D7asyuaXegKXWnaORUu/YQ4segxT3ODolca/yX5X/5Jn
	6VV1ueLbBA5RdKgcU44hpQDqQxlAOwleneUXSBKOQURy5cRIdVzNbBEhHFCQm8VmNYjbPj+Y8Zy
	xj0YqO9wuj73EpLAgv7iVXZFlbHQ/oHDBzohuY3YgKlRahYdMc/5bJFOMRf8h5V3yJbnEgDpK5K
	DKKzG1g==
X-Received: by 2002:a05:600c:4e8b:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a35ac3cb16mr111294555e9.2.1793008655265;
        Mon, 26 Oct 2026 02:57:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] arm64: dts: airoha: en7581: cumulative nodes addition
Date: Mon, 26 Oct 2026 10:57:06 +0100
Message-ID: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025737_772786_E6906AE0 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
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

This small series adds all the nodes of what is currently supported
upstream for this SoC.

Christian Marangi (9):
  arm64: dts: airoha: en7581: reorder nodes following incremental regs
  arm64: dts: airoha: en7581: add CPU OPP and scaling nodes
  arm64: dts: airoha: en7581: add Chip-SCU accessor node
  arm64: dts: airoha: en7581: add thermal sensor nodes
  arm64: dts: airoha: en7581: add watchdog node
  arm64: dts: airoha: en7581: add PWM node
  arm64: dts: airoha: en7581: add nodes for all supported uart and
    hsuart
  arm64: dts: airoha: en7581: add crypto node
  arm64: dts: airoha: en7581: add integrated switch node

 arch/arm64/boot/dts/airoha/en7581.dtsi | 673 ++++++++++++++++++++-----
 1 file changed, 553 insertions(+), 120 deletions(-)

-- 
2.55.0


