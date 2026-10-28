Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16B6606A335
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 16:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DjiAg4DX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBlkAu6Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=; b=DjiAg4DXU1Ijs/uipdJ1V0Tb9Y
	B4y9KVGhkKhge7oTofEEzF6URkWv+S4WxWhsEvOz+fIO7yWuSdbdJHtrId3/iWu4B/Xa3DZ1Vzyv8
	s21m+g9Leo6Bs5A6MwaG2NIwfs7rN6iStcxD4e3PHs1JffKnCbSE0odz3A/zFcTgpdnyQbgR0MsPl
	d3LSv05QruZ6PUB3Xny6qbcTvr5bBGAAhcNejfeKqX2qWZ39pukt3ASU9zfObh3LQG+pLFEKfySd1
	3djpkS1c3ZyORld8T/PRNoYSKWCJDe+XmgQ05l+8CkQNqkWLvhXEf+JvNnXuNd6PzMiwcXAP6a4kU
	jyR9l1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6rK-00000007ams-28l0;
	Wed, 28 Oct 2026 16:50:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6rI-00000007al4-2IT3
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 16:50:41 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13630505e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206239; x=1793811039; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=ZBlkAu6Y0faI05YdQ62VdbxXwtRweghaD7Hf6qgKKNzUPN8/C+8T0jGQcWi9aFNc07
         XkXnDTNrmy/c05czl2ctI4JyPufeY2hiJlTGeKfw7mZvWsGG6iWqjZoKS+6nWaBamL7f
         ZqH9lewnJOLWNMoxTxubMiEjkxw6sYPwBJof0CAqwKE5SZU6UVCt0xEAnLmuBqFNfAHK
         yCk9cGrj2kT/CsAiTHs/65GTEzM2vgVwozr6umyNjOmqB+Y3PfwRTJK15iY8TNsTiaVu
         EYmJujRFDIy4Vsn5PACWb+3YXW5kb3oG6h7iY1YrokksqIORB97Bi2mJQIqnEEtya7JG
         heqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206239; x=1793811039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=XA0mzvYdfYPedQ+GwyEQ+VAwrtgeZKAH0DniTJ4Y/syl23jbx4e+bnfVsU3UJof0w9
         QEaQ9fbCfKxRWkmORp25O/Bob9gQj59P+iMj2s76Yx9xKm8TZJO5Z09D72seUk5trVST
         SKTGlgpcUlekGbmY4usjEGSRO7zhXC9t6RLao2rj6T0QPjJRcdYvwzkcHBWSW7nscXs+
         vY5eMjvNGP5VCE2FaHUHAiAhVubhu/Zf3pJbeahlsBfUexKnW7PrCH9sgSWTSnoy0Ic0
         nIXnljyd51WmFSc0J+3a8sJkt//UYuLy0FfEislKSwvZkMHpji2RIjLsAD7lzkbJavx6
         U+PA==
X-Forwarded-Encrypted: i=1; AKwUvBwRmBvwQrnlOAGdbun8CLXe1DyJPVyS+oxiTEPdKY6zPxKEIg/dmwqH92B0YlbAX+lbkGauqsOo2FrzyhP0wQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYK53kiIWGA1K6sDCP03fgPoE+TgPaQiwL2UgIusrg711ZqleWfp
	vqedadxvIvmlkVisRmHcNKUSb0vJ31h7RWZy5TxXp9l7duBiTqAUyV3C
X-Gm-Gg: AYBFou0GTcqnusqPcIuIdvrEOx9Dc9elnylChFiR8Uks2nAK3xZE3Km7mcNxmWPV4f/
	PoU/4xwRMh3644RM/bo5QwMZX9D7hyXRin3lAbEFKRDD1/M8Mc8fnwIYysrz7prOs/tkWmmhPU4
	WfbTe5d1cQyNkWRbzdt3LjDEaeWL8E2Y/qtX1SkUqBAx8aHVeU8Pbj65T1+aUc9cGocjy1qU7it
	xf8BeoLTjyLFK2eCW5WvBbzIcLwOVzXqg7axMmiyWq+y2t5lNL5mIAGcmbewy4VvrbtprBzrjHC
	3H6i/M6qqzb69kxq4eqNRbx3xvjX0dPspDvEUKaDrfAOMsDTuyqoprHVd8PEdsmw/ck/r/dHwUw
	QZ0TeRAmbvD18L71w5nLipEDLvhnYhK7uaQobYOMbzpatXuLQsFc0ilkCPjYSoFIaY+bkfQbRRg
	BKAS5x2oxT/GRJoldg+FH7By0XBy+0DOn3E2/np+08P2xETqtxuBC/TZy8/KUSsYx6G7rhN7tB6
	4ofnK66QPI7C7UT0Rls5xvgqPSxgXQY8y8jWiXQNt/E8KStfjWAi6mOsBXFrwsyCKLZuptuK3dV
	GsPqKrBbtMhvOP+7J61k1sIUl4ZmTwyyFZ8k5bng3cFU13J8lwIfG2G5Ul3z7dzUlNGkdKln868
	VS3CkgIe2sikpkG2K
X-Received: by 2002:a05:600c:630e:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4a9678bff9cmr62960175e9.29.1793206238343;
        Wed, 28 Oct 2026 09:50:38 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm29895785f8f.12.2026.10.28.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:37 -0700 (PDT)
Message-ID: <6ae227dd.6c7231db.220083.ae75@mx.google.com>
X-Google-Original-Message-ID: <auIn2SfzeFL2CJn-@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:50:33 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Anholt <eric@anholt.net>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
	Aakarsh Jain <aakarsh.jain@samsung.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
References: <20261028120216.2657397-1-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_095040_605627_0435CE59 
X-CRM114-Status: GOOD (  10.55  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 07:02:12AM -0500, Rob Herring (Arm) wrote:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
> 
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For KPSS:

Reviewed-by: Christian Marangi <ansuelsmth@gmail.com>

-- 
	Ansuel

