Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45CEC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:46:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C77164E29
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C77164E29
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=llxeXWC/fR79F5OiEJCWcO9vlAEzcNdwS8luRnjoXmc=; b=mLGgodovVtYy7cqrLQA11mHriT
	VTJgns4TSf6aQ5XoEj+LX+Gx5Oh0RbteG/wMWeShK2sKJQ1mqy9d/zQ/nHpLk2F6iqcvRYE37Pmsf
	fk5rhaqeMGVr5lyixZU8Vhdwk5aU9xJF6xYoJwriQgsSR8RDEc38kd9ZVRSOfeuax3466MTk1zvGa
	SmwcK0oEQm9Cj08KlXIuyWxkkVS6Csva6+GJ+bFGDQI0eoPXI40UnFXNpR7dHg6rQPxNw9KqbmTsZ
	rMv7hObxkK1SzIGisyqdU/1PcdjnMnTJawCce9y5AYFnopWJijIlVQcvxsq0T5aW1DZ9qbE2AqOP2
	oBJSvBNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6S21-0005yr-QF; Mon, 01 Feb 2021 05:45:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6S1z-0005wk-7B; Mon, 01 Feb 2021 05:45:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id y187so12102050wmd.3;
 Sun, 31 Jan 2021 21:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hq9bDI4hag8HudmtF2Bm0TltsRh7MZgeaneVATDrPI=;
 b=mkZzcusQqcs5Pi6sA1AlPtTYE1SiULovPCNO4QWsrrAZKaxor/+faXeBjflYWDDxfM
 s3IPwbBMS22NOE9EW6ssPbXgmJKtzqMzMjJHqJURvi10615DowHxzMpdCy3B34ZoX/IT
 3GgBly+zktPKEffl8XX5hFB5uksG4Ek1v6d9PK8sTfz6ikTyetr4yK7DhxDLeWOVAom2
 CrzzUEU3Iq/AB73044u810bmf3Z6jC8hZWQB8vzRQDaPktIn/irxfS/Mk8UFWCGeXfEn
 GcefacN2KW5TtoFGf/F6qpYOjSzScepel53x+q3jyBZXdAzyHIKYFMUZ+x7Ar1bBkhfF
 qF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hq9bDI4hag8HudmtF2Bm0TltsRh7MZgeaneVATDrPI=;
 b=RbVD8wdkv6o9I8S4qmhEO2ED7iSngiYN/1H257DY1W3UdBL/U1GYcjM8mo6B2L7MKo
 yKSvooTBHw2n+okltAnLzdJyOZ/LOhrEi9bN6/YLX3EW37/GT/SFDzLGekAcpHGfE8r7
 hiS1JZ/MAeHwU2g0uIDD1PrzICROrU4c0XqfUqn5FvE1x7XkUrpViOd0VM8aqv1sBa7n
 kUEVi+X29PaNjPGMV20qQ5R+0tRy9I6ovqI/NUjfRFQdXeWCY9x+JVFnaqNfOCg8IVt4
 LaiybZimI143JuiGsEKNZP5KmyMmtzJPjvNZj3lRLBEsxWWbBD3D1RV3eDgzybb73nOA
 iG0w==
X-Gm-Message-State: AOAM531PAbKKGyej3yVm5zywwPq1efnjos3PyF2NIkUBrwLvOjBiXHmj
 qBwjrUs2QDUCpZa4+Ui2MuLmJKHU+LxNeL2n
X-Google-Smtp-Source: ABdhPJxbkyB5+dL1KWNCmyOBlqdpXq5cxY72VqKglwnvK2RfKDs3rSwOjATMCsxI0a5DkMonHMi2GA==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr335713wmk.17.1612158344186;
 Sun, 31 Jan 2021 21:45:44 -0800 (PST)
Received: from localhost.localdomain
 (cpc141888-watf13-2-0-cust663.15-2.cable.virginm.net. [86.14.42.152])
 by smtp.googlemail.com with ESMTPSA id r25sm27123540wrr.64.2021.01.31.21.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 21:45:43 -0800 (PST)
From: Bilal Wasim <bilalwasim676@gmail.com>
X-Google-Original-From: Bilal Wasim <Bilal.Wasim@imgtec.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 enric.balletbo@collabora.com, hsinyi@chromium.org, weiyi.lu@mediatek.com
Subject: [PATCH 0/2] Misc bug fixes in mtk power domain driver
Date: Mon,  1 Feb 2021 10:45:40 +0500
Message-Id: <20210201054542.1470695-1-Bilal.Wasim@imgtec.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_004547_394337_1388CCC2 
X-CRM114-Status: UNSURE (   9.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Incorrect mask for the "bus_prot_clr" field meant that imgtec
gpu power domain (mfg_async) was not powered up correctly, causing
failure in driver booting. Fixing this and also adding "domain_suuply"
capability to "mfg_async" power domain (for mt8173) as imgtec gpu
needs da9211 regulator to be enabled before enabling this subdomain.

Tested with mt8173 elm chromebook.

Bilal Wasim (2):
  soc: mediatek: pm-domains: Use correct mask for bus_prot_clr
  soc: mediatek: pm-domains: Add domain_supply cap for mfg_async PD

 drivers/soc/mediatek/mt8173-pm-domains.h | 1 +
 drivers/soc/mediatek/mtk-pm-domains.h    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
