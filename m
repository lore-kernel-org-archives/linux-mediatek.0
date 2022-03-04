Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E31DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j9KdkcegNsxpd9PdmSh30t7rY3wEN4ZvBwT61HH7aVk=; b=o/Jkw0DnTwchkQVL6zeke8tDqO
	1ck/O42oASCIiUGRTxyZWUeZxooDbi1JD455e4Q90+OYIyw0N0108NOKU2bUTeXTT+3V1eltQE6Xq
	fXYxSCRf98PNjPwL7d3QFaw40t04gQ9sVacD361WrAX2+plskrALdXUzQIMLndXraoA+VgO7TmNsg
	CbClzirWgsRUVGCyyf1sMOZqhW3BQSyr2ZE64DnPli0GD/8wmVeMF2QuLstaAt3w4Bj1sh1blx4MK
	69uIturqCdd9FvcvWyf2C4y/TffuGPM5SMGgISWjoHNRpOu0oWMUFqL9jkrHTXIMPZdp2j+OEKZK8
	5uU2lULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4ro-009Vgg-6q; Fri, 04 Mar 2022 10:08:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ4rh-009Vdv-42; Fri, 04 Mar 2022 10:08:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id b5so11912039wrr.2;
 Fri, 04 Mar 2022 02:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=5lH9FqmB9r27huwrwW03QkyzKv1cGa4Cdi1lEm6ZGVs=;
 b=oiCasSmZxW2Niq+7NicKuNDvP1EG9NDcBZbRbVAspDOimseyXnfPjZMJg1Tl03lFu3
 kHk0nHxMtLaa0PshDNs7KNWNa154VbZtJw5nlx8PXip1llrCJEFQOomMyQbhdXm2jIzF
 0y50BIdoyKOK3+uuqaPcQBxHeB8lcXNnV/npoN92NaeV/tavfOJ+xp4OAYvnQX8frHP3
 IlqQyLOs+VSwfFhwMJR7xzIXWAFlW30QsLT8BkNpdTMuBB1VYuz1RXleBoxA0Fc2TtMU
 Y2yW33Lp3Oa1F/XORTiwINqxz/g/naHFy+47jLj0lZYfDHXdosj5cAzmwhuPF0O4xIbf
 yLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=5lH9FqmB9r27huwrwW03QkyzKv1cGa4Cdi1lEm6ZGVs=;
 b=dllXDCyRcV91MtTMHNR4O5wF0qJo9okhWBLGDzr4utQZDZjrI19sD9wFF8mnIhFkz9
 jCkN+1wu+Hv8zhce+vdMBklaOPBtXO3lqVJ0xuOUlG1ntzIutICU9Fu+hjwL2NRwCNSz
 DwTRqJ+obSmONRCRtQKG6Sr5UDOonXZNU8oBD7+6doE0lE2Vtsk/CFn+zuztivm+/bEW
 Qbhf+Kh5dn9XLZEV5ejcfG6KBJupkSk22o65RwvQnfXPpKdrrEuFZ1WrBRXJrh3jDFOe
 4ewY9dvPPQ08h4TJ/aLSL4tbezntx+Wl6yzzfpKWvG4tCPRkR99cjmnd/0B/tX/b0Pt3
 zsRw==
X-Gm-Message-State: AOAM531/V5CV7flv2zom7pjkVTz5PGv2cB74WYV3CrgOqG/aAl5sH1lJ
 PlFRV5QGjPZUBrD1A/zJe4k=
X-Google-Smtp-Source: ABdhPJwp5wNbI4cvDR43Kvv9DlnKNh5I8meYl21cLGp/ukDe3dnegTeeYf/twNdlW17bK1I50Ud66Q==
X-Received: by 2002:adf:fcd0:0:b0:1ef:31fe:d08e with SMTP id
 f16-20020adffcd0000000b001ef31fed08emr27563175wrs.667.1646388526465; 
 Fri, 04 Mar 2022 02:08:46 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b0038986a18ec8sm447269wmq.46.2022.03.04.02.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 02:08:45 -0800 (PST)
Message-ID: <e1b90372-a041-db6e-f35a-d17b26069e40@gmail.com>
Date: Fri, 4 Mar 2022 11:08:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] drivers: soc: mediatek updates for v5.18 take 2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_020849_242794_2086B6B4 
X-CRM114-Status: UNSURE (   9.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd,
Hi Olof,

This pull request fixes the compilation error in the mmsys driver. Sorry for the 
incovennience.

Regards,
Matthias

---
The following changes since commit eb1b02bef52ae545d5eb24116d5c099f738d39d5:



   dt-bindings: arm: mediatek: mmsys: add support for MT8186 (2022-03-01 
09:26:56 +0100)



are available in the Git repository at:



   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.17-next-soc.2



for you to fetch changes up to 62dc30150c06774a8122c52aedd0eddaceaf5940:



   soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver data (2022-03-04 
10:15:47 +0100)



----------------------------------------------------------------

mmsys: fix compilation by adding SW reset infrastructure



----------------------------------------------------------------

Rex-BC Chen (1):

       soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver data



  drivers/soc/mediatek/mt8183-mmsys.h | 2 ++

  drivers/soc/mediatek/mtk-mmsys.c    | 6 ++++--

  drivers/soc/mediatek/mtk-mmsys.h    | 3 +--

  3 files changed, 7 insertions(+), 4 deletions(-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
