Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A083606A334
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xPeNTyHg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PON7QUIM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=; b=xPeNTyHgFg1Dcc
	28QABpGd4e71SrcnTwpl6cAK/y3fTUWtzOwHJCy9MlyZNC8eBrTTv+S5CppIZSn9l9HESmCO/wIn0
	d9uldWwP2goDFCf3vcFCZq2DAISMtFuPzFZ/F2DHricleHrOYqTjBFlTdVA84DLIBB3taVxFKHAx8
	8ncEdSF83/ksuwv8x7eqaZ/B8CqSnb6QsO1DVcT4DUl8asjdWXSNnXqVSZK/0Sqb8/pyDJxQ+Y8on
	1PMEUO1Q+0PtLimHwLwxxVIq0FTPl6UEQrKSpuJKqufikfeFAWT9lILUmo43RpF0Cr3I6IQ/Vq8lY
	8Y3D3XBP5wtkkgJFcXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyuH-0000000FssT-31Zr;
	Sun, 08 Nov 2026 09:09:45 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyuF-0000000Fsrv-2yL7
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 09:09:44 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-36e795af1d4so39881eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Nov 2026 01:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794128982; x=1794733782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=PON7QUIM7+uy5JFsGRS8AZGju1OYm5QW49VEuertjYEreBFro0WrXrq7mVs6wHdtp3
         +8syp5aDmpQ/Jxz5fFmbZO53thx/zZRLdrvLleaRVqp5WL0tPt+0HRkN/WinXm4ztdGf
         z9GMm18NNgUXfjY29lK5QZlwyFEjhPzVd+MxbkPHxa7Aloe0KCxMesnlXUI01wpxIrg3
         JPSZsTTLzSKiCkMPKnffg6CUbnnCpDJvXAc8YVfLJlKSa32W+QlKJeRpEoFdFKh5W83+
         OJGs/LxFgOgpxvPPpuVIvHncdoufh617Qg8+H1BHgGnDsvQVHuhQcZBBYDVWMohqm5zs
         UKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794128982; x=1794733782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=fvR9ZaimKL6PtoTVxbpFhwpxMLgFmpeF/GZM3bHCwsFJcbQsc9nbseeoBZlAYWI6ol
         JJ4n8nj+/2wbTOk3umA/FEa2y5IAgCLDluzl/kGTL9Tw0SbyTQB0h3MUrDhiFcRkJuHP
         bxZehGFY03mykpfDz9dkrqUo3wOV+gxyP/UaVAReqcgY+x+Lc1nCO/bdoqCKWuB9FisQ
         MMHxxG2UvSlnbYAC+2ncADmWr9Bcsp6YLsifK6E+o64weZwDseHNxbKMJTodM6xv2nsV
         UThotGkj+LmF40GY9VKzTsxP5lxwNBMqbdvGZEsh9wSyjWM8P0TdPchfy80I8uAlNExB
         Xa/A==
X-Forwarded-Encrypted: i=1; AL+hErGmeE+CMBsDEzUiJUjDJJgC5TXR0oDzC1nbS8sN/Y1cIcF6OzMWPJVhEifWmEHEm/NC2HMVzB5UME5oFWpxHg==@lists.infradead.org
X-Gm-Message-State: APuU4Z81mU4R24TJf7wA4lkKA5Z0K9M7XC+cWXkOeMTWP9dZVRthAbMw
	VfeeOa/acjmyq9qBynvQ3eT4U0obXXf2TDcmV4BYi0m7nFQyh6z1zfoH
X-Gm-Gg: AYBFou3oPQwlhYX6l/Cj0W5ZXTgiVbGviyt9AIPm/h38YNy9BAH1VJ+qt7rGJxtK/th
	osUnZ0WJJM3wMNukKJSYmgQMQh3sQlfdqp8D6v4+Rtb3e0CaCipsRM6C7KAQrpA2bj5zi0bj3lM
	ZrbJp94My2tRk4tkGakmOK50BFCWu+6GwvRIRhQlFT+wSeCvdZlmJcfzVnMl0Cfvev0/7xWGv4I
	u7YBNDfzJ24X+lhev9WSWZFPNIZFMh5DRgd3kAC8NfGWyjs48bYQ/XEByCunTJbldsgoVGkxCoL
	MIhd4eU5Ptdi/cBK1CK1LvIuWLtj/iUcRHyHEooA7ICb4XPmm+FoR3Ww1i+3V1aGRzXW5gHbjJq
	pTwE7N7vusCy7Rn20uT2a8eQmR3Y41eQ+DgpZcdpU1sZNZqkBR1keacCxt4LDy0H9PpFq5jJs9M
	JH+ewKnlLN6dN/kC839KpESM3t/kwUyebEgFxqrxdBluv8Jw0bLCcuOeekRuheCkE7bPhL4+vWC
	xCb+Z5Z0ATF7K01Q3biVH2UF9ipj7/8t4atoRHqkD1c3D/qlXlTCUoO7VOtAKtS5c/dOGI2P8Gh
	CuOxV7Pd8yFyLE7uOVfDsCd8N1kIh0csDzCeDDqwO6n4re7LQTg=
X-Received: by 2002:a05:693c:881c:20b0:36c:a2cb:6ad0 with SMTP id 5a478bee46e88-370f620bf5cmr5775018eec.8.1794128982350;
        Sun, 08 Nov 2026 01:09:42 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561852csm3725259eec.9.2026.11.08.01.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:09:41 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: mani@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	sergio.paracuellos@gmail.com,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] PCI: mt7621: Fix reset control leak on PHY initialization failure
Date: Sun,  8 Nov 2026 09:09:04 +0000
Message-ID: <20261108090904.2409-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179407116392.87368.9250979022176600686.b4-ty@b4>
References: <179407116392.87368.9250979022176600686.b4-ty@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_010943_746863_447F5305 
X-CRM114-Status: UNSURE (   5.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj

