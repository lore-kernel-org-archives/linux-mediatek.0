Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EF7C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 15:33:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17DC120878
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 15:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DE3Ks33K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XC1BKR6v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17DC120878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Epv7BwFwF+xLLMzjAJvPq3at9Uo387s0sABQZCSHfbI=; b=DE3Ks33KotFMgluufGqPyb9NF0
	bD9KJ0P4jS/vJeI4MNsj+h1UIIeFeUvT6G21O/BxP97IdvJOV86T4bbOSjlVQM2NzJ6qOLBufKL73
	gCzyHBrAf7UZPyIQDRTvkleVoErFA0XUFiC5B5ZD1fdqI5rd2MiZCHRgjB+62eg5U8EXbW7cwiLTj
	sl6YvwfTsA6mArzyVJBefum2gezbAE/Pf68KQkWptZft/yMnmbdn4c1RtLnVLSqSyjTa/ruNF84Rc
	IyxB9ytq5v7vwsYCi9rm2Us8xJRcLH7Q9G6M1sRkCb4TL66XPZhJdbnWW9ORsAdAgE3UaE8oHaRIM
	tkO/1nxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLpir-0008Np-9b; Fri, 25 Sep 2020 15:33:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLpip-0008Mz-78; Fri, 25 Sep 2020 15:33:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id t10so4097311wrv.1;
 Fri, 25 Sep 2020 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=nogfsGVjWR/Og0FkaRdcdvcYtgH+/eIeFHCsBOy93fU=;
 b=XC1BKR6vLYuzUAHptrfFFCRSRg64+yoOjXTerR9LS+i9NVmFchUK7TCtsji+LHETBd
 7Qe275WFD+FCpRQOua6h4uNm+9hUFxCJTj776b7TQOaZHPYV8o3u18JwDNFTTnXiuhiB
 /wyh1Khw+BP9PnLcrRDPWHJOCrl0spQIuzbSI6mn/xbiNsqlcIdPMDs7Za6K7Ro2Ipli
 XTYH0co/12cjEkSmZYIQoLEnq6cGoNvTX22GEtQT/1e1cm8JeCE8Q0lNwBQYb0pZCjEg
 CSz3RQTis6m49Nry52zzVCuoj+ov5l77EOyOFq5r34aV52v71g5cT/vJqYwFI3lavURe
 Njyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=nogfsGVjWR/Og0FkaRdcdvcYtgH+/eIeFHCsBOy93fU=;
 b=HRgIHqVkNgn35YMI1ffRQcUkleuhGUxYbtPhVkr19wQdtnEfBi9+hfj0rTcV8MypzV
 cjpKoLR0cUGMVscB26TXsmwP1WZJZvmnYymd93f+no6lyLW67VJRxJUBINu+kM+jwZfg
 hkYZcCpsjddWioB1c79z7O5H+W7Lz791pQix23Kr2A9zx6vEWwOquqL5nweAsZ3m+doX
 TBVMtgvE9X2aGPQzEk4uEAOHmooWunwaTlIk+7i56XgayBWxuvVDj0FUkrOtnutD+UnN
 TotEG2xKdyyd8YznCQF7JPIg+UuFec4rJkBcrr6l/MfviUDhznL85jGSQYyXveNxD8TN
 QZ0g==
X-Gm-Message-State: AOAM530rlyL4MLPLkX/uoWkeMrGN5Cv7EzlRVXGU8KWVGMFUG9OoQX+Y
 uMrprhbVFJDPu9ZOStBNDcs=
X-Google-Smtp-Source: ABdhPJzliAd1LKaRNl1q4LsVqwAjzPL1dLVsXWOfuB5XeSMt695ZdEdK+9nf7nQxn2taKYloDSX0PA==
X-Received: by 2002:adf:edd2:: with SMTP id v18mr5078087wro.242.1601047998000; 
 Fri, 25 Sep 2020 08:33:18 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id a5sm3384942wrp.37.2020.09.25.08.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 08:33:17 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek SoC driver updates for v5.10
Message-ID: <ac672cc9-059c-b768-3a67-1f674d4a2b7a@gmail.com>
Date: Fri, 25 Sep 2020 17:33:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_113319_269386_D778D476 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Olof and Arnd,

Please have a look at the below updates for SoC drivers, namely the cmdq helper 
function.

Thanks,
Matthias

---

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.9-next-soc

for you to fetch changes up to bee1abc9cc021f50b90f22a589d9ddc816a80db0:

   drm/mediatek: reduce clear event (2020-09-25 17:27:40 +0200)

----------------------------------------------------------------
cmdq helper:
- add new functionality for writing and reading values to and from addresses

----------------------------------------------------------------
Dennis YC Hsieh (9):
       soc: mediatek: cmdq: add address shift in jump
       soc: mediatek: cmdq: add write_s function
       soc: mediatek: cmdq: add write_s_mask function
       soc: mediatek: cmdq: add read_s function
       soc: mediatek: cmdq: add write_s value function
       soc: mediatek: cmdq: add write_s_mask value function
       soc: mediatek: cmdq: add jump function
       soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api
       drm/mediatek: reduce clear event

Krzysztof Kozlowski (1):
       soc: mediatek: mtk-infracfg: Fix kerneldoc

  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |   2 +-
  drivers/soc/mediatek/mtk-cmdq-helper.c   | 113 ++++++++++++++++++++++++++++++-
  drivers/soc/mediatek/mtk-infracfg.c      |   4 +-
  include/linux/mailbox/mtk-cmdq-mailbox.h |   6 +-
  include/linux/soc/mediatek/mtk-cmdq.h    |  93 ++++++++++++++++++++++++-
  5 files changed, 208 insertions(+), 10 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
