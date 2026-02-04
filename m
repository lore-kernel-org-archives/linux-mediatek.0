Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6712E8B393
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Feb 2026 03:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQbKpNswXJTNi8jP1PSICS1P2ix+Ty3CgZzKqkQPvCQ=; b=jyQtTN8Q8OEGMD8cdhpEDAWZ1q
	69OyTbGhFPn5AGlv/GMNTxD03B7AbxY07XfJ8gNgFGx+YGBdpdy+f+NcNuWL9k2Ko7vMPA19t5+sZ
	wg8UGizYd4DoRZ9IOR8vWRXuEWLnt3PMDlIU+gYjDmKivLams5UgqDopZs1HcK0LpopLj7Ta+f0LG
	INTahV5Y+qIUd1vS27yrgprygjJ6rAge5CkLim4fuTAkUWh3MlZqusv3WzdV+Q49SxQpQ8iXeQ7Hh
	h2d4EU8tn0h5I383CWbMrPCbSUaL74jqHjqEFSCz188PfVHCFQB+njFbK0dbc58SNbwZ2r6ibbpsq
	Y3so9+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTcb-00000007prG-2XMz;
	Wed, 04 Feb 2026 03:32:05 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTcZ-00000007pql-0IaU
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Feb 2026 03:32:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso44461205ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Feb 2026 19:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tier4.jp; s=google; t=1770175921; x=1770780721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQbKpNswXJTNi8jP1PSICS1P2ix+Ty3CgZzKqkQPvCQ=;
        b=VgcDH7vrm/X6j7UzYI+osemn3mS1BEW7qIdWlz7Dqfw5vwF46Ae8S7jYeBBpSLSl/4
         G55xTxVWUnLmvzVh7qdddCRJ27BTGA42plMzrdS7T1GXoxXBEnTqVcS3pjek8JD3or1b
         8Qr5QU83wSY4SXv+znxAd/ccP7mA1aMM4SLhFJiDZLtekdX+rcxdLwRgsTahLbORsWXf
         ibteQVv4sQmPJ+mOypSz73wk8VVcA5cL0qGoGpB757MY1VGcMoNTUbiAqmeDi4J8poJI
         jeWu3x5Pn2AaYgcRGoDa+PFrEXCo/QauXUTD2cd6lsYX6c5EodPFtKM5dwR3IJOS6+QE
         Uzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770175921; x=1770780721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQbKpNswXJTNi8jP1PSICS1P2ix+Ty3CgZzKqkQPvCQ=;
        b=RAuUUV4XsujpLimbAKohVQqSzb8X2x1H6SQpa8SUPQ2Z5Hitgx+Ox0h/YNT1y23ULw
         UbU/rMHOauMfONvTDa3T3HNsAz6gkKYJJZNWMnB0NxZ3MvWVjtFQsasvn3kG2Qy0jngL
         SNS68A/yWL3p6T0KBOoqxfsxIrb/Xi1WlLf7B6Xqk4Vrzj7aLH3w9e3uaP/MqiLx+pPu
         j5Mm/A/sww1ixjBoYiHPjKvKLNJskELt+gt2AUPE2NiWEVPEpuXtzhjtlyZv7XMA7iu0
         hcE/E8XCOOelVggjllGdRKdHyqUXhTY8FqFxfTw88S8XBvpnWJiVjlAMBUDyU5ptHIyW
         uSKA==
X-Forwarded-Encrypted: i=1; AJvYcCWznGbZ/yZcH3NUVPQgjz/V/nwOga61+/ESMZGBVa6ghus6r7GaQfZxRXBGtQhyWKu7WTqpvHC1U7RaQ9/ZVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFFyMVKJ3Q6KNwqMzrFJwalsPAzwYPEAHIbuX3L4UY/0pMD+OZ
	bB0XRZGAMH80fyPfbiuxnfIwTRVAbN8D2MRre3ErV72XaMasnxqP2vpeh3f0NDw/oEc=
X-Gm-Gg: AZuq6aJjWXepXX+MPyZBcC/7IZMqX50E6C4lgTN9dVsMW2qf1o5btpuY9FpP8I5TVLw
	WnV2dos344OFAGTeQERRa+RamZnSa+4RMVYtnT/fF/kmy/MPeOveyaofeqDkVQuds+z7aYJbOGV
	lyl0afiJGeqBkWSqkD1rnM5tW3ZxeFiYgtM5ONIZEt0dqO/DZfmBJZ2Ajdu6yZIXrGsJeRo1eGa
	dE+nG7VlEOxLXKnVw2YTtF2vNzKi7e2UtQMmjv+M5qe9T4PyFvFAwFXAVGV/hfQaJpKf+Kd3gTE
	OinjqDoPNvtO+9zowGUnr01ve2tyceDEKETfvEgbegQYHDkA6t6SI7Piq6ykpGzb5b7TlB85iKo
	V2gqGXajAdo3mvH8eEOKmpqRe1eA9uIi4rN1qJCbgyvpZVzPNrILSe+qm1cSSYIkx4F1uGJbxI1
	2zeoeXBevitdNteOo7J2M26Y4BdqvvDUl+x64Zu/JRTpct+B0=
X-Received: by 2002:a17:902:e74b:b0:2a1:2b5f:d16b with SMTP id d9443c01a7336-2a933e515fdmr16462875ad.31.1770175921652;
        Tue, 03 Feb 2026 19:32:01 -0800 (PST)
Received: from dpc2500057.. (fsb6a9315e.tkyc502.ap.nuro.jp. [182.169.49.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93397ef6fsm7931335ad.95.2026.02.03.19.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 19:32:01 -0800 (PST)
From: Keita Morisaki <keita.morisaki@tier4.jp>
To: martin.petersen@oracle.com
Cc: James.Bottomley@HansenPartnership.com,
	chaotian.jing@mediatek.com,
	chu.stanley@gmail.com,
	keita.morisaki@tier4.jp,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	peter.wang@mediatek.com
Subject: Re: [PATCH] scsi: ufs: mediatek: Fix page faults in ufs_mtk_clk_scale trace event
Date: Wed,  4 Feb 2026 12:31:12 +0900
Message-Id: <20260204033112.2513463-1-keita.morisaki@tier4.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <yq1jywtnq7o.fsf@ca-mkp.ca.oracle.com>
References: <yq1jywtnq7o.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_193203_142495_CDC5D648 
X-CRM114-Status: UNSURE (   5.25  )
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

Hi Martin,

> Applied to 6.20/scsi-staging, thanks!

Thank you for the update! Greatful to contribute!

