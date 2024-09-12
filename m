Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41538EED60D
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SnjQo2l57VNy0/9b9V7jPtL8zuWKJeeYd2oBfdE66r8=; b=U37HdG0TP5BFNhqDjN47umPGzu
	w5RdsR8ZNokYac6M5bAvon02n5Kr8wqQ6pDabKZQjuUQswTEtmiiNRBdFjUZi5unT+QjQWwC209WF
	jNxkH0iUdyfN+ByaoVoVkuhGd0WPIkZhgbZblRj5DdpPNY4L/QY+sgVQ3WYDSyLK2H9ZL4r2Q0JSx
	tcKMgAWTB3B6ugoouh58zz8K9nU0pkGV45SUeAClsSYTapi/eYZUgLIbo6B7q5PzM1fhgFGvdsYk2
	8tJj1jwP7CzkTGByn/R0tE4AjIZHIj0E7/4Sid9K3lC+YFQpNuZQAuzILIvUmZ1u9CPELn9jLr8la
	qd/QNcFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sol4u-0000000DPXK-3Fkq;
	Thu, 12 Sep 2024 14:45:48 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sol3n-0000000DPCi-3JfI
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 14:44:41 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7178df70f28so776737b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726152278; x=1726757078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SnjQo2l57VNy0/9b9V7jPtL8zuWKJeeYd2oBfdE66r8=;
        b=jb4aey744u4MN6PbHRINYxZkLKjvdGWjUqsWXMyWy503iGKANT96ms3u6Gao0CFs89
         Yg+6/F+6cQo0PVquGb2KdfV3cihOfutlFhVcsNgXBCvN2XIFV0sbCXYbszz4PQMndJ8U
         WlpJvFnUOYXNSVfl3wTW+oF7CTQKnuXpw7i0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152278; x=1726757078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnjQo2l57VNy0/9b9V7jPtL8zuWKJeeYd2oBfdE66r8=;
        b=PeI4XKhx6ViB6dJW1+sZsQCD4iQet5Wsh4xtsBRhr1xBrJix/+x/dFi5sI9iSU6C/m
         SKxn13nq+itx79iKy8y7u7QGa+sbrk+wTaAUSsszIvoW45/CkhhPFg46P0CjD4uOGABM
         WFDoZCNrEVxVMwPfNLmGgiIqvKJGuYMBp2i1yRzEZq7jLKr39BFpeSHAupAQ6LwNILrg
         vfm2fv43P/Jf+bQk2B5ue/dqiTPK8jG9Ie/kQH1M7iQCAA7Dw5625b/bDv5IEyeCxKeF
         vIdeArH5KpxJkZOTGT9WS7pTR+rZchnrzA+gqSmuQ9XUR/kBthinTGN2pO36HvOtnLO6
         aPlg==
X-Forwarded-Encrypted: i=1; AJvYcCXzYfr2Ol8qfDUd7YLstEqOYS0dT3scSqdo22F2oxcZF4Zfq9y3bFVP8qDhwJIatAigmMusx68fAEkNxOy1nA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7D1bXxmbKxQGylTTjZHshI6rObTjU7EcZ+FPlwP/yLRBLDOeb
	RlCgn/eNcnZDp0E2Eu7cB8lOLcYgVOzyajM8Hz5NYMuW5tK1HnTvgBjYT1Oatg==
X-Google-Smtp-Source: AGHT+IGe8UZsXDErTlsFVsKEqocto9ktULRfXcWaq34cYE7rYYe0pLbf4dzAsufnELC8pqE5fNjDew==
X-Received: by 2002:a05:6a20:ac43:b0:1cf:36f2:21e9 with SMTP id adf61e73a8af0-1cf76358fdfmr3795202637.32.1726152277655;
        Thu, 12 Sep 2024 07:44:37 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:8638:897f:b6cd:8c44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fdee186sm1826269a12.85.2024.09.12.07.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:44:37 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] Fix dtcheck warnings for mediatek,dpi binding
Date: Thu, 12 Sep 2024 22:43:57 +0800
Message-ID: <20240912144430.3161717-1-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_074439_862189_58476DA8 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

This series fixes two binding schema errors in mediatek,dpi binding.
The first patch adds the power-domain property to the binding, and the
second patch adds the port node as it's required by the binding.


Pin-yen Lin (2):
  dt-bindings: display: mediatek: dpi: Add power-domains to the bindings
  arm64: dts: mt8183: Add port node to dpi node

 .../bindings/display/mediatek/mediatek,dpi.yaml           | 8 ++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                  | 4 ++++
 2 files changed, 12 insertions(+)

-- 
2.46.0.662.g92d0881bb0-goog


