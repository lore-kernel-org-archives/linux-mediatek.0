Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD99EC63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:43:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8966761279
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8966761279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=446VXahAZrhsnLsxrc6dejE++OyyYgMe9iM8Ph0A4Gs=; b=eQBqaKT84WVN6C
	uoqQsXcVrb2fCxHY9swIyujNA5S8jwV/uSJ68yuJD+Rrh9Vy015umYgY2ocA+OMunzw5ExvhMQh89
	KOvn72EmxusnSJpb6wyK0JbCPt0qzZAb9ceybHCLf8VpeGvOhICdvgEFzFiMooT1FId/Y/YQj6snt
	ZY4VbcXXFedrT2IFkeb91zqdRpxlD06LfxzEdGFhpyfZHL8xQnfW5ObwZ2MiB8vIZfZ1S4qGiNsQb
	kXAi8G98+DLmjjJALc2Qaep+SbHkHSSeAoTsoiTllorhyovmSQknJxfDCbPSz69bU/a/ZpgReWGpm
	Kg1uh43nSU2U2z5gs7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6TMu-000Z8Z-5j; Thu, 22 Jul 2021 07:43:44 +0000
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6TMs-000Z71-9e
 for linux-mediatek@lists.infradead.org; Thu, 22 Jul 2021 07:43:43 +0000
Received: by mail-pj1-f44.google.com with SMTP id j1so3256241pjj.4
 for <linux-mediatek@lists.infradead.org>; Thu, 22 Jul 2021 00:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tmgFh+laGR1ETgWPH1UC2DgtrT+7uoldLT+DjSVRjRE=;
 b=GFbFGiW07n7HOZUK4iIqqdg3z0UAAymD7IzPgE6ipM0bLsgyFJATrkXVTwgdSzpTIK
 JBCanHJP7PZEGCzn78skNQ7ZEun5VhPBHOYLRAe/02oi6Rx6uS6/MHNbD4N1k/KoDl2j
 OdUquA6N6fm9LkE8PgxYoRpBoahoYaaKqU7xVsxtEBPPyf1q8IenPs2+yS2K79rNirSj
 /gPHMxkEk/bXoarrU/am248/pOiEYIb5916my/PEf4uT+e+pU3UZmh6EebSGH6xdylKc
 i0F6mZ2WMUfr0sbRqApltwWmYZP2ILEaNY3u7kKyYW34x6UMRkq62Ve4aqH3b+gk+Vqd
 QrfA==
X-Gm-Message-State: AOAM533qz5ADFrhojuz0Pc7iwT5ZCiC1D4fDfJdKfecHBuCK9PDZ83r4
 k/zdfrrmdpy3yymUbXuYMC4=
X-Google-Smtp-Source: ABdhPJwZPZZpLlQlQRGfvL38mhDENathno6jCcOWC1WWxig35i+OquRj+UjbawtzWTAoxjRMhPGp+Q==
X-Received: by 2002:a17:90a:5e0c:: with SMTP id
 w12mr20979155pjf.45.1626939819862; 
 Thu, 22 Jul 2021 00:43:39 -0700 (PDT)
Received: from localhost (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id v27sm30346344pfi.166.2021.07.22.00.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:43:39 -0700 (PDT)
From: You-Sheng Yang <vicamo.yang@canonical.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, chris.lu@mediatek.com,
 will-cy.lee@mediatek.com, rex-bc.chen@mediatek.com,
 "mark-yw . chen" <mark-yw.chen@mediatek.com>,
 Andy Chi <andy.chi@canonical.com>
Subject: [PATCH 0/2] Add two additional vendors for Mediatek MT7921
Date: Thu, 22 Jul 2021 15:43:36 +0800
Message-Id: <20210722074338.760456-1-vicamo.yang@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_004342_375535_0A7511FD 
X-CRM114-Status: UNSURE (   5.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

* Bus 001 Device 004: ID 0489:e0c8 Foxconn / Hon Hai Wireless_Device
* Bus 002 Device 003: ID 13d3:3567 IMC Networks

Andy Chi (1):
  Bluetooth: btusb: Add Mediatek MT7921 support for IMC Network

You-Sheng Yang (1):
  Bluetooth: btusb: Add Mediatek MT7921 support for Foxconn

 drivers/bluetooth/btusb.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
