Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692E1C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xzQ4zGogKT9ijjeuPZRu45C01o05MgA7QTyTUv9Fiqs=; b=yOUkW4VTu21h0xU4aJ5mZX9ZN/
	1HVRzj0iCekJNRIp/LXmrLzNwG+m3xjSUJj16CLq00ouRbTBvZ5aRTPuDP6+mFeilLM3WXYjSwiLP
	IZPz/hiNurssBndoAVTK/EMGV2urgvdHHP58WsOyxjx455HNI/Cviy5o34ROj4VTEfRvgAPENd2nG
	7GXi2rl9LShV9CLQymOhBGQweE5lUleok90s7FNaV+l37GDFvNIYjn5t13t2zIRz/K62IbdNl7a3E
	TNB8WySW3HGvgYKFXdQ/gdwtPGgTHUIfg7yn7LLr2bubYbLZs9AsB603Y1+eqLCBrjx8OacYwMYQt
	jVsfUJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm3U-00HUC7-8I; Thu, 17 Nov 2022 21:04:16 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm3M-00HU5x-Le
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 21:04:12 +0000
Received: by mail-ed1-x533.google.com with SMTP id i21so4375301edj.10
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Nov 2022 13:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xzQ4zGogKT9ijjeuPZRu45C01o05MgA7QTyTUv9Fiqs=;
        b=7/xMAYbNXpDCRv94jbVuGuNRABSL0yvog+ebnjOvSBptbGaY9ek0+tdOFiZ5smY2sV
         XNf5OosNV7TSHYNO0XppadNopkfNUt3jTfDM0JTxsVczupAAHRD8qTiCN0EO6YM2SPDb
         GFnaAxOA/fRs7XLhVuwyAsgHemKhKoCg5knNn0OrdLGSpoDnKcB8rrSWjoZZjJPLVk1m
         epdk0IAlXvevdUiCUgLt4WYUUS73+QS2aVqDwpOHlEWpk9UnHuYY3aQuhRUg7TJCsx3b
         HzLNCn/wyituGdovbvGUOrKwaS6mZQKzjFMRoRe9KveL0FFhqoLwEHbuMy7XFUFdg+Q4
         Kmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzQ4zGogKT9ijjeuPZRu45C01o05MgA7QTyTUv9Fiqs=;
        b=jPULTqALkRtAeAhXasc9mkAHnMeIoccS7ExDrrjfNRmdeZalkC9LxoY7+HwTjnm8yB
         XwQw55avZXe1zDEFq1qqnseSdDxnQlPA6uDwDXb/dJEnMeGLaYtkoQgx/ozwzuJ/8aMu
         1JT4+HPaeTi845lXLx1PKbTRYpdTGjR2/1BppXc9dvCgCcJsyJgNvOtN/58uzpA0MLMZ
         n+bhkYaEeksAL6iqRQduv7Ag/uUqdDKCA8MuxWe45nQonCI7DqFEP70MrVZaq/zRdZkU
         OqOv5CAL0wEn43K28f+MUyGNPGh6TNUJq1T/5iCODROzcNZFJOb69VKU0hVfsHfeKsqd
         GrQQ==
X-Gm-Message-State: ANoB5pkJC4Fb7zmjc+3NkyQFLkMO/36HgYdOMGIrzSAFC3uy8rQec2Qr
	UjS0z+kAFA8ObtDnlCEJAmc4QmtpEilI6kOL
X-Google-Smtp-Source: AA0mqf4XjTgdWKhwU9xml63us080tOvJFlhGJvQ3RLSKnwNDWGozAB4URcX/BIyfRoK6yTwayay4/Q==
X-Received: by 2002:a05:6402:b6d:b0:468:eee7:324c with SMTP id cb13-20020a0564020b6d00b00468eee7324cmr2936483edb.119.1668719043959;
        Thu, 17 Nov 2022 13:04:03 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id p15-20020aa7cc8f000000b00461c6e8453dsm970807edt.23.2022.11.17.13.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 13:04:03 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogiocchino.delregno@collabora.com
Subject: [PATCH v3 0/7] Add minimal MT8365 and MT8365-EVK support
Date: Thu, 17 Nov 2022 22:03:49 +0100
Message-Id: <20221117210356.3178578-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_130408_723994_13381313 
X-CRM114-Status: UNSURE (   6.10  )
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

This adds minimal support for the MediaTek 8365 SOC and the EVK reference
board, allowing the board to boot to initramfs with serial port I/O.

v3:
  - Remove a number of components that are not yet supported (they will
    come back alongside the corresponding drivers)
  - Address issues found by dt_binding_check (mostly fixing pinctrl
    bindings)
  - Address issues pointed out in comments
  - Reorder patches

v2:
  - Add missing dt-bindings documentation
  - Small cleanups addressing issues in v1 pointed out by Krzysztof Kozlowski



