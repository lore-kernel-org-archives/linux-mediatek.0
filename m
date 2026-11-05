Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90060606C8B8
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 19:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EehU9Dqj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQORMlZS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=EehU9DqjvQPMpc
	N5bj/lb3ABWazdxlO1Hz5HCvDgwSierjesxyqZYy72+bXC1faIB2f9YAoo3/bIKRmqddMXjOZn9FS
	IKhx055xuqpDpfAWu7rFHOAww0BqJg/y1oXr9Tai04x0DoJrCi4HG1Hi1QT/GC1Mp8Y8xm5227KDG
	Tgis8p5p9hYiv2M6CwTLRBVJLu1jjpVuCOk+tBEpiuB26sljN02kovXvnpMK2c0ImK/jFev12jWxW
	QUtt3DZ4nC5IQ6iIcGoprqmOReDVGiOwfnSr5MwLs7fx2OBdQn8V/hyRU9Rj/Q26CjdptxWXE7BFy
	aJWTNakEHTu8FFUovg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Ov-0000000AP6C-33NN;
	Thu, 05 Nov 2026 19:45:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Ol-0000000AP1g-44uW
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 19:45:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so16948475e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 11:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907922; x=1794512722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=DQORMlZSP/fQx1KmWAO40ucY/cKhnvnNfvpkk5uryOs3gOPz7dBgBnwt2FdAu38e80
         NsRNWNlaXwuDs6PPF5Z5UMngto45D4tg/htCCIV+4wSGNRbaW9nYIvULpU3jZKflHaWu
         0SmMNgJDJlnRSg8G0592SNbZPHtR5wIJFv6cmjiYXGQe/i1vuwYtJhxERKVJXhVPMsWc
         LlSuZJhtTI+jXrVedgFj9WbVf62duXKHhJBjJhAasfqIoHj2nY1FnTGtPDw/aXYaQIDL
         DrATBDLO8cDXUc7JwUNiE9Dp0LXBiL71GWFSqjIEHrcumTPtmRZsxRg/HMTFSX/Hg2Em
         lZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907922; x=1794512722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=MxtimREFQSlpZd32yRDWnkl+itnT8jAWfMduYNsDZ1qUnHQXYf+fuZkP/GR8/B/bkT
         0XlrQ2ZXdMSevXSi75nq3wuc6K80/Gp5+ozLW3k9C4gvBklMa4R73HRaPYKGG9ukKuG9
         nWaBXOyPls9JoIRLYk3Cp0M8kT2SZ9qP87KGQ2OTdXqi9gtP4m2kmgjZCk1mSUwDDcJv
         Tw2wacnUQ+uhQUew1MhJPLUAz82B2JdzY5CZ0qMmZxZrdNknPCdWDJlcqqy9sE4daTik
         maptEzLB88t/y3ryNjPSghY9AXBnkgJ8CXAJpVBGstP9zFZ8eA+fmxfz9bVdvdb1WR5u
         K1RA==
X-Gm-Message-State: APuU4Z9wdqyRFl71enAeo0b6Q89wulc8mZL3xdwaxTH8U0eez8OMvbLM
	kuj3rf8dLqYm0AtEDcff+wCoMrWiCrOr8c74Ibk2Tbz8Z6xnDZtDfVzMNnvE5daPExE=
X-Gm-Gg: AYBFou3m0E8CT+j3FvrC/Y/VgeEGo8Q90no2d95CWRIP1uvaYzWeuJL2Uo8HlV2MHRk
	XUw+uz2ksyC1vfjWph3Ril+xJeOWPdjSxL09Ab69KMvpulzz+Lif4ClGma6FoV9BOFtoCr/KY0R
	oQu+K4lRQNfktGSL62f1fP391NyL/BshNeReiQvF9M7V73n0zQ5OmZOf5oW11Qe/g50H8Z3d8+G
	9NGEcv0V8Ed5oGJZn7i6V57RkBfjXPr3LcUWaZiw0sGo6m7ilofCTsfzAWvb8XRy2y97p3MKoSI
	yQvig6uenj6HvP9od9Bci65ui++13OIbBxaLxY66Hr8BDusas8aTKCa+wiRXYNKYBi28JrYvnUZ
	zUjVopETxaZiwXZbkvjZg+tAIM7LooOCl5+0s+UhlxM8MWvz+jTYks7vJz6/b3rr615l5cF4DKY
	i6Xnnj9GHheKNmSiUMAW+V0MBUPsYZTzN0nnivzUnxRNMO0rsXam/kzOZamAZL70EzBtoMXN8iN
	+kJjnFovx8GNnE7JhGEGQyo8idqt5DBKl7rsy5W1QHBF59Ns5OnPFUKa6hxpUS+i9FGgih3wjJs
	txGcjM9C5LlPYQm/m89ueRMZ
X-Received: by 2002:a05:600c:5285:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4b6db4a9a2emr3123275e9.2.1793907921887;
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 2/8] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Thu,  5 Nov 2026 20:41:33 +0100
Message-ID: <20261105194426.1113050-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_114524_025886_6FD2ABDA 
X-CRM114-Status: UNSURE (   8.99  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


