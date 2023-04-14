Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE9EC77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FJeAOg25JWX/NJPCTUMVwLDaROKqhiw5/DLFXk3sOjo=; b=2mAxiw58D+llKwDTVyk9sQZd7O
	rma2qHoHrNoi0B+6xOubtLCyIoWsdC21ieF5APdETIp16lC3JmYMbdRgGjFUORrDlRoAJk1kcGVkT
	LQ11HGMFQzJ+reAagu4QQb1LL4Kj0EXNO4RMSE0E0ww55SFFxzgZ5556xH7BkaeXlQD8vFY2WZ3Ko
	4x2El+0iRn7fa6nm2GwU2FT1B7r6556dgnjM8QaZcVmK/O+OzSqQ3H/ZGYYU6wlKvn1CU/vh2SLAs
	8SeOhlS5Vl1Wyj9C+4LYHZ8K4/C6vkcckqbqlY8yRr8QVh068DedukLA4aAnGYESRbNc6+rXgGC7Z
	VqdJ0xGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMdt-00A9sh-1W;
	Fri, 14 Apr 2023 16:51:21 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMdp-00A9rF-1g;
	Fri, 14 Apr 2023 16:51:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id j15so4446072wrb.11;
        Fri, 14 Apr 2023 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681491074; x=1684083074;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJeAOg25JWX/NJPCTUMVwLDaROKqhiw5/DLFXk3sOjo=;
        b=A9F7O2vUylOWXC8Q/ltB06BiiJi0O4vGA+3zyE/R68KGpajeIOJewD0MfOLiv05+mb
         GJxl8V11mQWqsDbFTOVFoTqwm3xZASTFJ3E4VANOE+82Xnq2LaoyVW2DtFf8WStH4A0/
         sTZNqPrdh4SnkpqO49/37a6hbF//5r3okJogkNInlB50Z0UVLpXXvyUHKE7EiDYwtszN
         +k3Kj+2/q7jo5NYp5fFKm1fr0GOAg7Srum7GEBWnZODkL2RMN4tmlJ8ERvAet5P2Yy7T
         Xg89M2UwF+D5+HBorQmKzuNIJxKZAYWZo6ICiGt58bCgHLp/lMaQC2xSUktN9QxJu8T+
         L0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681491074; x=1684083074;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FJeAOg25JWX/NJPCTUMVwLDaROKqhiw5/DLFXk3sOjo=;
        b=fQh4/WJ13v3zLs4c1HfbNBn+ItdOKVFSXzr40EhZb5k4rCl8Nptjff/8U+3/9EMHM4
         3abzyhyTxYHb1lmukcirmFFoXKhJUIHsNgehDSderfYWxGKmJp13IYUqtwJkL2Su3kZW
         phSbi/QWGtPvNUSlxt6sAaju9JWCtSftOcYx1jsL4eCcn1DlhPM2GWD8FskcytPRNr0Q
         fzpYg1FI2Wvq39cLZnRucG8RC+SPUBGnk6tlJLkv0pLK6VGygc0Qy8Z7qYxww8Dy1XvS
         Y5Ti8osGTu7vOkQgnNlQa2vvPscUrE+byYs42F5pym3/attnl6/H8kdVT/cezyRBd+4B
         vK/w==
X-Gm-Message-State: AAQBX9dmgyVmEyzBOBpD1C+lV36qTNEml8mgkAvsNvCDucG85YgUcZSe
	FrSMlvqZVnLvufDMXWLfn1CNy6pGDpSeAA==
X-Google-Smtp-Source: AKy350Z6PrZD3m91Rvx5hGElszJ9vAc0udIJKwBs4o4ZAmdubpdpAEjvuJBl4B0tO2gc6TWUCErJ7w==
X-Received: by 2002:adf:cf10:0:b0:2f7:780e:ee0a with SMTP id o16-20020adfcf10000000b002f7780eee0amr1472173wrj.64.1681491074440;
        Fri, 14 Apr 2023 09:51:14 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y14-20020adffa4e000000b002f5fbc6ffb2sm3779524wrr.23.2023.04.14.09.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 09:51:13 -0700 (PDT)
Message-ID: <c3b17357-e08d-da7e-def0-a7f9e0b95cb7@gmail.com>
Date: Fri, 14 Apr 2023 18:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Xiangsheng Hou <xiangsheng.hou@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek ARM32 DTS updates for 6.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_095117_565203_1A6197B2 
X-CRM114-Status: UNSURE (   8.40  )
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

Hi Arnd and Olof,

Please have a look on the few changes to the 32 bit DT files.

Regards,
Matthias

---
The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.3-next-dts32

for you to fetch changes up to 6154a79fdcb3b80fb91c25b4528df18c538f080d:

   arm: dts: mt7623: disable home key on Bananapi BPI-R2 (2023-03-06 14:35:17 +0100)

----------------------------------------------------------------
mt7623:
Disable not exising home key

mt2701:
change node name to match DT bindings

----------------------------------------------------------------
Arınç ÜNAL (1):
       arm: dts: mt7623: disable home key on Bananapi BPI-R2

Xiangsheng Hou (1):
       arm: dts: mediatek: Fix existing NAND controller node name

  arch/arm/boot/dts/mt2701.dtsi                 | 2 +-
  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 6 ++++++
  2 files changed, 7 insertions(+), 1 deletion(-)

