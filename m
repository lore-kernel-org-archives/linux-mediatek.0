Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F48C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:48:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5213F23D6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5213F23D6A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tjkv1tunKml7zwBk/2ZqMIOt5TePKQQW9O+Xev1Uh7U=; b=xw06ygcXUb94+rzG2pPAzzar2u
	Ql2ejXCzuNj59LURMfRiakdgI3XnJ1PdG3FQIKaIDSYKQB85vvLttyHYWfr8tagpYWbkTt/LBOlTV
	WyCvBjMvMcc3dllt4nhaToce/VMvctmzpDY/paKUqYgI8encaV9IoTHa09myJkKlmfbXeNIJ7GeK3
	X0XdTSDL/jAtq6G4+stA4zBmG02ubpFm2uCzrbI8uUjKGTSIHLpqRubAVHtcwWzjDKK2PWq+GEAFF
	IfOjQFPJbRJUDFLOBJemB12cDuNr1Y79AhEO9Tf53hggIJdr17P11AFRKef3WfkGGSI3v50kJAVRl
	uvdpqKFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJUR-0002lx-Pd; Thu, 10 Dec 2020 10:48:04 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJUL-0002iK-Ee
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 10:47:58 +0000
Received: by mail-pf1-x441.google.com with SMTP id 11so3679988pfu.4
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Dec 2020 02:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/1CLF3jhgzuG8CXsCmdXZEYaITzNoEWk6wc5CrYfURY=;
 b=MYtZnMZka/yCtbeqjEtHPQMPRp1pS+LV5yBBJOSv5CxwHvamurnZGghYtmeuTU8F61
 sDFbaTQ5Vh11gbpI41KxB+fM6OZ66qRVUMM00yzvye7KdgyP9tov+Pi9eAdXP0k5Qz7R
 uSrEc6Xw6liW70X0OkD8dzvMZDS8DkyvuyhmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/1CLF3jhgzuG8CXsCmdXZEYaITzNoEWk6wc5CrYfURY=;
 b=VR7gFwVtb+NeRbYtYUiho0TsO1JpWJSFsjCZaFn3LS8BkmAYffRcYOVy0xUAxEm7ra
 PDUc25d0Z0kMyd+e/HWCBRpAVwm+Ig9kUDy3HFMjRnOXZqQy7qpQwHkAGdrtkuANxv34
 kR/dClIxytjfUaXa3pCjvJpwdCv7SnoNix64+xaf1ysN5YCzR880tgmbBlB34hfOGUXe
 8TMZP1vP7n3Z2Jytax38IXbL+YnHOmV6Mf4huelWVIvxR6KMbXIyTFSWl7ZaQ9PIvK2Z
 Aazrpm7wej9THnMqSo+np8ahOmg+6NwqfRGNCcJBmwFgG92Pdqnjt+2kJNFgeWMyAjCi
 pQlQ==
X-Gm-Message-State: AOAM5310ifl0mPz4eOA3AWd5CaMgITTdSi1ShL5hhsuT/YLDruSkc7th
 T3/Ra2FuKdBhdD3HdwpEEWCB+0qhnj+mnA==
X-Google-Smtp-Source: ABdhPJz1UOPyHnOnpgetFP3LmdV2keXwZM75/Y/XQxXs0IUr220E0wzUZTDhvJvtJum/Y71jRrXerg==
X-Received: by 2002:a62:d142:0:b029:19e:6b61:7f80 with SMTP id
 t2-20020a62d1420000b029019e6b617f80mr6244596pfl.9.1607597272744; 
 Thu, 10 Dec 2020 02:47:52 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id y1sm6386658pff.17.2020.12.10.02.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 02:47:52 -0800 (PST)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 0/3] Release allocated periodic bandwidth data from
 reset_bandwidth()
Date: Thu, 10 Dec 2020 18:47:44 +0800
Message-Id: <20201210104747.3416781-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_054757_506081_BA37D70D 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


xhci-mtk releases allocated TT bandwidth data only when whole
endpoints of a device are dropped as there're only {add|drop}_endpoint()
hooks are defined. This patchset adds more hooks and releases all
bandwidth data from reset_bandwidth() path, not drop_endpoint().


Changes in v2:
- fix a 0-day warning from unused variable
- split one big patch into three patches
- bugfix in hw flags

Ikjoon Jang (3):
  usb: xhci-mtk: code cleanups in getting bandwidth table
  usb: xhci-mtk: delay association of tt and ep
  usb: xhci-mtk: fix unreleased bandwidth data

 drivers/usb/host/xhci-mtk-sch.c | 180 ++++++++++++++++++++------------
 drivers/usb/host/xhci-mtk.h     |  13 +++
 drivers/usb/host/xhci.c         |   9 ++
 3 files changed, 133 insertions(+), 69 deletions(-)

-- 
2.29.2.576.ga3fc446d84-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
