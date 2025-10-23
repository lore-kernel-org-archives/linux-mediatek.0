Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEB0CCD1BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OWoL1UZ/q1eqzSis7uaNsqbiHg0hktnmtvNBWCaQMdw=; b=HNrpBQagm8bvP+z3rPKSUs4kkf
	TMdgj019qFWkwWubHknUzvJ/S/O3uUTwIb8SGIgg/DO41zw4nA36w2XB0CGLc+3zlph8PrPcX+kZR
	q4ENwiDaIiviNgOn/gwnkCkB685BbljYaku8pb+XHD37otQ1FbhCPEhjViAy1jfTEw0HkwxE/J0MJ
	tJrIix4vW+TkFOZu5Sflaw+m4QpAxX9OEYyeOqTBkemfLP0BpS1Zukc2o3Mj94J+6tTQlYO+rXWex
	v/+KCdU1+51fhl3CifHMrT8dJdvMDnPjtZvowuEk7POBuncd6Oa3RpHOS5EkL8lPYN2q2ivWAi57s
	zaACSE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwmS-00000006fXK-3VAA;
	Thu, 23 Oct 2025 14:59:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwmQ-00000006fUk-1I7y
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Oct 2025 14:59:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47118259fd8so6276525e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Oct 2025 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761231544; x=1761836344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OWoL1UZ/q1eqzSis7uaNsqbiHg0hktnmtvNBWCaQMdw=;
        b=A313K2YVI1Gq6eHsWtId1HqRlePGh4lqCLP+VZst1FtKzrwWt6q9ZeoFtMeVoHMtJb
         ruN2xT+WnWzPxoKSvgEhOOhJmlLnmp6rx5YpQtjMJQ8vMwQcgRk4+oJVLaXopvuk73xB
         kPH0pLPXKhuEAi4maigDiqR1TlmPUKSucsza8BDjxSlF5rfPvxLzsn+O7PRa8TlD4VYB
         +9jpCKPQR2AbE5wJzmuJYSYW4oWVq6CjArEKNWlgzb0gC9DLGYOfxKOjQ4xyXwWR+Gc0
         2Vx1//iU9qRm4vsxKeeCxhDdXloAKzOoYHx43/ZK8I7EejEZ1rlXbUfraQWuz2N/557k
         q5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231544; x=1761836344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWoL1UZ/q1eqzSis7uaNsqbiHg0hktnmtvNBWCaQMdw=;
        b=TwFWWJQSz4d/+pfR00vYMLc7dfIzPOCBIGHgdl5b0Z3wqL0H7szUt8MfrZi+Mfbqae
         oSlHJ1NCdBVCSbnIdIzjcBO7n9KxtZp+P5IDrnP7NqJyNLOOwhTcSoW0RmDe4SXmInc1
         WDZr7VrZLngoQCMeEBEjkhaEQoxkn4w8ogVUQd07yW4nxiS4YXHxpoWgZpKwpQwKGgIE
         PUEGuaRfkGjv866Qt69mrn/pNxxjfvDQwxkuS/QmHZ3maE2KmnV5UFLrH0OdffpankoX
         CyizCR6LTx8t12yQ4xqbGmcv60w1FXkiiFhmehJLx5h+No9v8onf/1k8+EJC7DpSWFQD
         riBA==
X-Forwarded-Encrypted: i=1; AJvYcCX6yQLwBP2LHcWBPDVotDiBkFl40xxcfwrf9koCgLY+ZtQYnEzhHzLnbIy3B/bYvEhlfjQT3UBZGphHBu3yMA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww3VWSIfCarw0LhebRV1kcOrGPEPkWuteETDOqd7x/sEGz8Spf
	OmiWZyae8DKUJOBYZYmbYx6ASTpVf2RctxpsabebuV3jRjW+lK+SRSh2
X-Gm-Gg: ASbGncvUf5ykBGmd/ESfqn5kZHERNp7RpXkhPK/lzAy0XOHHL9B1xWAcArvkisbJwZr
	s4t1VhsHbK3rKH8X3lOqoZhzoukE2b+HYkNUCoNjtGN/HS/6jSpQuTZDC27WaXkjY6DY3Z5obl5
	TG1RYucqaf3hWItG/8r1MZl5N6PRxlFxaXf6aY9Da8OMqJ9qMVvF95QHahq3rzLocevagb1xG9h
	z96n52eYUeQCLyFwZoXL2um3WiaF0nd+cD263ybsJdg9byYJv8lQKPaD9OhkAEoYIrGMNbB7rlU
	J/9lNIph7ZIElPGDE7xR9+HeipU1SKQTMSJrKLPDE7FJkAkW8U/vZ0A5fxa1BSGrQ600VuazHzh
	DK/8N0fxsRumYvejaj0DdTyLtcSt+QxBskhDfSz6p0ClUnfubGzoXgXisuJxfOFLlENzzDefJxe
	CSOYjhf3m5T9vPlgcHu1B64lIuoPNWggQzqVwkwZpp
X-Google-Smtp-Source: AGHT+IHX3KE00pQn3aNP1QwDiE6EhD5Q3hRD8inmO43mr2wuZ5/VM7zYPzKmzGmrYwsAVd3vpyhaEw==
X-Received: by 2002:a05:600c:4f89:b0:46e:3edc:2811 with SMTP id 5b1f17b1804b1-4711787750dmr167242385e9.14.1761231544110;
        Thu, 23 Oct 2025 07:59:04 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-475cae9f292sm39822325e9.5.2025.10.23.07.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:59:03 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH v2 0/2] net: airoha: initial phylink support
Date: Thu, 23 Oct 2025 16:58:47 +0200
Message-ID: <20251023145850.28459-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_075906_348662_688E2DEF 
X-CRM114-Status: UNSURE (   9.50  )
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

This trivial patch adds the initial phylink support. It's expected
in the future to add the dedicated PCS for the other GDM port.

This is to give consistent data when running ethtool on the GDM1
port instead of the "No Data"

Changes v2:
- Move setup phylink to airoha_alloc_gdm_port
- Better handle phylink_destroy on error path
- Fix bug for device_get_phy_mode

Christian Marangi (2):
  net: airoha: use device_set_node helper to setup GDM node
  net: airoha: add phylink support for GDM1

 drivers/net/ethernet/airoha/Kconfig      |  1 +
 drivers/net/ethernet/airoha/airoha_eth.c | 79 +++++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h |  3 +
 3 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.51.0


