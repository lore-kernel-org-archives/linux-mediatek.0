Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EDFC3064D
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 07:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oXxCcB0Z+0dCULL6U9IF0HAu/rj2QG5+rPAdSAb6U/M=; b=vO6XSAAvxLKHaMcZI7d0MfL5PL
	AEJs6e2Hwrz4URQVbbAm38QKV4pCFzphXQi/wIBVLKGHgiRgtXTJWXyzBzc0S4oJ8YROeoP4XA5Hs
	C5Z5K5DFM2qFXwQ6yuvHmusupB9IKze91nGYauNt2VLCLO9EuTeM3Mw6kjTI3djR912BhyrOupX8v
	I7TnTpUvJ6DMgMHDuq1DHR9ESKJP1qpg85fQwBH0oNf+t+iDramBpyQGheHldDNo0tSOUbrgCJfAM
	oQl8suEzESuY+zndxklOv7hhtVpv6DdZy+RBjTogs9QPXQeHxj1Z3IQHX2YpW95SnlwuGqpIsQbpG
	Sha/bs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6Tx-0000000Cytd-1taf;
	Fri, 28 Jun 2024 07:57:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6To-0000000Cyse-09Il;
	Fri, 28 Jun 2024 07:57:13 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-57d07464aa9so316572a12.2;
        Fri, 28 Jun 2024 00:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719561430; x=1720166230; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXxCcB0Z+0dCULL6U9IF0HAu/rj2QG5+rPAdSAb6U/M=;
        b=jpYkYAy4iq3DdTDtD3R44rRnvZ4yNbWldFD/IFvLUsdFuRJ3WlNlRGnSEISNNAOE6c
         iwiuyhiaL0dnETt7kUEiXuQwhTQaZf/DvXlp30RstvX7zoDTnjC+rhmSDvLxu9m5QRFj
         UlSsdqHxe4xVMP775mUUZicOmWOg98DX5qTxG9aQY/L3ROlhpaW4fUczTk2mqjw5UR6G
         oaZOfe+Z9hwycUFBvDxv9ywSsN0ZCT/K4rli/2u82ZTaq70Sd4rEDB+Htsb7/4p5MVia
         AuzM6I8Wwlx4Xyh84kzaNXELIm2njj78RHREavcHeMK7VGHu8b1HrpWCpkASBU6+gur0
         ni7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719561430; x=1720166230;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oXxCcB0Z+0dCULL6U9IF0HAu/rj2QG5+rPAdSAb6U/M=;
        b=pnmrc3lhEKpVQDPoQ4Csp+CJIhVCABd+DYggqD9ibrbw+KQSToogKUC4sdnwnXAoE0
         cC63MmxDjKYMWQ4TFGS2ZbUy4YIPgmF4fy8oaeT3YIpsLBmf94IsoG4iFRCCugMMcE0W
         xKyt5sqDTY+t66XppsXs1UXcGCTyXXKWS9GlMxjmeZeMXb7udzNkQyQRU8Q9Tta9am4n
         IXWmhWwdBp2iYY0MyjQoOuN4H99R+VxYgtihsxhkJeZbYQA0n/byzLCom/Lfs3objFBV
         6ZMjQ97g7T6QwLg5Qn+U39SYiYiUvujz6LjitJ0cHqEE4sI1zEtX048niePTeoH3l4CU
         Et7g==
X-Forwarded-Encrypted: i=1; AJvYcCXqKZ1hHLN7Jo5d+xUfa325jmvHH67KU2ipOIMhTffTdCuvzxsNJhn/Ff0ndLg+oL/iHIPK3iGbA9nsLuUJzTGIPX8h3fG+XxZ02yLMpwswFqB0x0ibT7eXsVUwvBifTQxUnD6E+a+Vr5h1zvHyL9mmhB9o5bN23Dk=
X-Gm-Message-State: AOJu0YxWHlOVZW1o59vx5bp59pASNolHol/pQCeQOEecXKVPl44wgJVT
	NvuVDqRJM3Ew4jqiOeN/ovIKhM47af4pfPnzf4j2wkcCizWeiXrm
X-Google-Smtp-Source: AGHT+IFmEbCjQZFy/ogPSt3g7CBFVjWgRQv31s+cBKY0y24QaOs8ykRRIzd68n9VpXAey+wrYSuVyw==
X-Received: by 2002:a50:d789:0:b0:57c:5aff:112a with SMTP id 4fb4d7f45d1cf-57d4bdceddfmr10452368a12.32.1719561429728;
        Fri, 28 Jun 2024 00:57:09 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5861324dcb3sm627145a12.26.2024.06.28.00.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 00:57:09 -0700 (PDT)
Message-ID: <7614ed44-7613-4912-9b4b-62c92abbc9bd@gmail.com>
Date: Fri, 28 Jun 2024 09:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Duplicated bindings for mediatek,mt8173-scpsys
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_005712_137831_D8DADEC8 
X-CRM114-Status: UNSURE (   9.02  )
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

I noticed that "mediatek,mt8173-scpsys" compatible is specified in two
places:
Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml

The first one seems to be "real" hardware block. It also has a Linux
driver at drivers/pmdomain/mediatek/mtk-scpsys.c . It also seems that
scpsys.txt was first added explicitly for MT8173.

The later one seems to be "just" an MFD with no real driver but it
seems to be actually used in arch/arm64/boot/dts/mediatek/mt8173.dtsi .

Can I ask for some assistance sorting this out?

Relevant kernel commits:

commit 26331d261f49949bff6477fc9c844b17076fa245
Author: Tinghan Shen <tinghan.shen@mediatek.com>
Date:   Thu Aug 11 10:57:59 2022 +0800

     dt-bindings: mfd: mt8195: Add bindings for MediaTek SCPSYS

commit c84e358718a66f76ac0de1681d15d8d0c68fcdab
Author: Sascha Hauer <s.hauer@pengutronix.de>
Date:   Wed Jun 24 08:17:04 2015 +0200

     soc: Mediatek: Add SCPSYS power domain driver

commit 859e42800bcfc4db9cefaa2c24d6e3a203fe961d
Author: Sascha Hauer <s.hauer@pengutronix.de>
Date:   Wed Jun 24 08:17:03 2015 +0200

     dt-bindings: soc: Add documentation for the MediaTek SCPSYS unit

