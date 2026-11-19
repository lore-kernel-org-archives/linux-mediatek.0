Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2456B606A320
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 07:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AyGWTIvx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oB8GBTj3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=; b=AyGWTIvxJT9l/Z
	bG2TECAQlTj2D5NDvhrIpCVYO13UxvqvSdO3lygD0B/jROKUhl+f+s+lHXLuZfUJFPuztoyXmYNoI
	o2rupxJz4xxTr9cH/LUMvCnFJ4RX95EU+D1lwq28UF9UFULQPCPSlK8VM9E2hDLyk+01E1exbxVyU
	/JWGGDlOLWBqNAsfT+Xmf99vWx/0CjKOqsjn5/9AoCx5Xo+V2vwB3fjOqEQx02WDhg+r7IC0Iw9bp
	UxSFn+c0W8wZeoWfMUtPpAt83396l5UP6yBj/A6ke+6I5+/L2QXhtBGQTHpqcFwCFbqQlChfjD6rk
	+KF8T2B6ceTa110/0n8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwJR-0000000B2mB-3ebs;
	Thu, 19 Nov 2026 07:12:05 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwJP-0000000B2j1-0KGW
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 07:12:04 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso16739675e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 23:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795072281; x=1795677081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=;
        b=oB8GBTj3uCjz5RG2zL7uejU4ge6QHB68NzQ7jpObW69vQ/ncEoieBtEg2m72Kgx91e
         rrjjom9Vpu9NiA6BL/228O4Q5xKEGzGBCtQqTXqsK/ra3VDhI2vjchFQ1kDtCdAuzlen
         fSIDhz5baRrQ+gx/TUfFcTYqw656psyVM3jYvcfp9stNlJnMGpXwvA/UpY2bpYumYZKc
         K9R71wDQj5zOKUxDgjqroenK7KVZO2EYi3pMeJ0oHg5nZtlXGzVKUcuOrR4EtXI7ejlU
         kxlyL9EcO0p9iPx5ayKxYP+7YVmappAUFxKkSqZd6s2KhqMLHXo/+xrwjGYLhGMgQzFC
         c87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072281; x=1795677081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=;
        b=Av9EI1oCgOZL2j97wzZ6Vkv0zle2Up6zAzWDWkAPz2eVK8Z46uMk2R3iq3l/rgsREH
         lyXvQVUkmjKf29zD/C/khetU9Ncomz8zyvvodlGpnbua1p+05VEVGKwvYfMZvQVPhi/j
         olgLZLH8U/arSYmpmuKB7rk6867f8IDaxXiPnWC6jT2DvSHrp2FXfEvZO5Uc4ycBaNyL
         zwa6m7nvK8NFoXAKIfqydaI5zRcRpyv362LJl1SdjUu0lKShtTJHEYEHjhiY3DUGHpVA
         zP0glModfMUg9TrvirkU3slcUOnBB+1GIhVkl27aIF4k3P3SSz8ufZ+2Iv+aGXjRs+IP
         PNxw==
X-Forwarded-Encrypted: i=1; AL+hErFRXPnyLzF51XZIe10WZla6L/a/hddgJcqqBGMSJdLK/COAcyXCXVV7cdb1qQcczeJWDKzmvTOl9D3NzmUBJw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8lFm65IooJ0mTB/StLZoNsoP4y98CHXJUawhEVQGaN0gmz2nNd
	Ed/3PHr0EXoxeLE7HA4Ai9iGQGBrP1m3an1GkORSATWTQJL66qZcDfPO
X-Gm-Gg: AYBFou3dE86UCnLx2JvFbjKtk2KBLPu2rgb1z+mPW5iLCoYqsuJb3Ww+QKeZPk7i1YE
	o+IXgYtia4Hi8ZQ9QKUX6nnrSjOZhfebPNhnKJbJOivwPVLLgz4FgHMm+ZUzbt52Z/VVvXB/gLU
	vwaA9Sa/mDQVJTTSYQGEci2FP2dofRetRJA4arRrE//lERSPmx0rgUCLGbFM4mozDtUpYQkEzpI
	o7TyvxoOqe4lQ70LvBzoMYmfuzH1Ro4waGO/5vLKjUO6lxRCCCHUe6qzfq0rmQB/jrTolSv/VV+
	Th//z54WthDVxPbi3BMLepiZhIzQ/neHU1H96yzoYiY2VYINlI828PPGOj3PH8PVsCARPmVHOpZ
	f/+tyOdHBKkGyu/UQLaR8Rfo/reDEoMw1VGkiAJBp7n2P9qAt14EVJiG8LMb7hmFwGCRn54sBc/
	+5sW8ZoTC5otk8i+5qZ2gWZyi+dIwksifVRQBmU6erxbJnG+FvpOpN58CrOocv9YFBv520sFxjB
	ga6FTXa8Zv+fPKevIunyli9GeCF/Rz7ZYbjl35hmI+KWN/vDFF/9cCAPnrm+DbMcfpKANnXMibd
	Mk84CvEfWrXFOe7Jsm42niUG6iRgFvQqGn9Z23L2hlniYaqI5oXNNx2w4qOpPgodl+YzKGhNd7T
	DzXVNjNjOWWc91y1Ea6MINUHkJSWV/r6XaZgzTP/Wn9y6KhU1+F4Jf/nwiH6b04tCikPvN8s6va
	bNHWpTwYzEWjxnjbqqCWgAMtvT38KoQpoGV8BPhgNm7TqiEpA20ltM
X-Received: by 2002:a05:600c:800c:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb7da3d581mr99024035e9.35.1795072281098;
        Wed, 18 Nov 2026 23:11:21 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-0199-55e2-7041-f103.ipv6.o2.cz. [2a00:1028:8388:a84e:199:55e2:7041:f103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm8676988f8f.4.2026.11.18.23.11.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:11:20 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 0/2] wifi: mt76: mt7925: LED support for USB adapters
Date: Thu, 19 Nov 2026 08:11:18 +0100
Message-ID: <20261119071118.78938-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
References: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_231203_162363_AE70CE81 
X-CRM114-Status: UNSURE (   7.17  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Felix,

any comments on this series? Devin tested it on wireless-next and 6.18
with two firmware versions and sent a Tested-by [1]. The series still
applies to your mt76 branch.

Sean, JB, the question from the cover letter about driving GPIO 8 from
the host is still open.

[1] https://lore.kernel.org/linux-wireless/20261108190313.11505-1-lucid_duck@justthetip.ca/

Thanks,
Josef

