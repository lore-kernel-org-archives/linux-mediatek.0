Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E002C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ZleyFtPKCEKvI3w3RRiluJ2MiXfAzWgSLKNVELcbX0=; b=rAi/eFShxXmYUhEXeD7xh1pvqB
	MOp9xh9VxepBNA1Sv/Wmp/eqZH9PcmSlX4Ob7ks8+7AoxN67027ju+xspcKISpwgw0hJFCVweiySD
	eBTpZS05e12MyW7SRfP9sEk/4yADXZwMRD2UROZplyMlu9nfU07KCd7H1cCkAmjNr0Cgm4j6kUVI5
	TejLu678dyulHg8ByLA/xXEgiK/W0/0cwv0U3wcTbAEyarjzGx7fCCW4rxYN5D42P8Cc/fcUDaT0y
	oCLOsDnRx87fn/dYLlyDC82mdJmurkO72PRmdTRpNgfnnI/fq8MWrt4nbs3dzezlxnnFK5ANkg448
	D3PHayyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myVL4-00DIOD-6s; Sat, 18 Dec 2021 08:45:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myVL1-00DINH-GM; Sat, 18 Dec 2021 08:45:09 +0000
Received: by mail-wr1-x432.google.com with SMTP id q16so8504817wrg.7;
 Sat, 18 Dec 2021 00:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=06eLN17oGEhjR34hvwbzQG7R8lpfia5AJHcAmwtgiFA=;
 b=FbFIE8c2T6OguLgnommh44XgNoM9ji/ULVszq4DKZ1AjZSikgpRQTREep/av4FG36x
 8eCkwRVM6vIwen9n6ViiQv2yArACv4nUvX4F+7ONGhlKb0wkYEDAtJLtfL+kkpjF43fP
 /38t9rkYKlNW8OEhEFliXr0ryrGmy8KVc6wdFtAJeaDb6QachI1znrcFNBA91nahpUhc
 uNkkoV2ZQczH7BW6OKmluTL0GcMfFCIPMA609Me4D5vwyv2rMRPjwocl5dPFLlwG9BNq
 thH0Bs6SFMbdtfiOQeISZftxyboI9rLcWvc2JPgK9wxHHb7lYUg6H4x1j/9VFrgfVS0I
 tP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=06eLN17oGEhjR34hvwbzQG7R8lpfia5AJHcAmwtgiFA=;
 b=IaNPrUlTzOdNl9WZnPl3r+jkskHVVC/OlrrBQKkKLoJiTloB07Zp7P97BM+zWjk1eK
 JpUNmjVq+auPtTs3teG8pwrezj+vUx4Vs970rBIBw2Cmu6HpohLJUJPBg3aQJnSZnEQT
 RYvmPtVFA315lW4mNRVOhZDyS9qLl22HLeW8qtlhOHQM63BfSxsrgHrd+C+UiIh/hdBw
 MWG5EtosRynwB9343Ur0+cXs+T5Zv0zZl42Fv8A35RdWpWu5bsP3wU7i2xhTnXrGRBfw
 bRXnEql/aM/KfiH4gRMnp9Mm8chwUq0BgroqztwJc1Xy0j3a6NEix6a+oZs62IwHfxC6
 PBrQ==
X-Gm-Message-State: AOAM5336XfUsWoIAHpFNVLc7KwpChJstbzOIWQUGfekGyFPToQXunglq
 PTli674/TN5YARl2kp+4oEVAh+u4AfA=
X-Google-Smtp-Source: ABdhPJyJa4OvOo0OMslCtmRd3ytAtEcRpW64uX3qBhtjA+EZyhW/RugxJNaxRIcHITn+qdPca27xzA==
X-Received: by 2002:adf:e545:: with SMTP id z5mr3601221wrm.211.1639817105302; 
 Sat, 18 Dec 2021 00:45:05 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id n1sm11751822wrc.54.2021.12.18.00.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 00:45:05 -0800 (PST)
Message-ID: <9ea1efa3-492b-7204-58f8-5253cd5b05f9@gmail.com>
Date: Sat, 18 Dec 2021 09:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Luca Weiss <luca@z3ntu.xyz>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dt32s: updates for v5.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_004507_600948_401A6CB1 
X-CRM114-Status: UNSURE (   9.69  )
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

Hi Olof and Arnd,

Please have a look on the 32 bit arm DT changes.

This time there isn't too much. We add basic support for the Fairphone 1. 
Hoepfulfy in the near future we will see more HW support on this rather old SoC.

Regards,
Matthias

---

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.16-next-dts32

for you to fetch changes up to aa67bacb482ae66bdb18b78ddccf7b9180441588:

   arm: dts: mt6589: Add device tree for Fairphone 1 (2021-11-15 17:41:21 +0100)

----------------------------------------------------------------
- add device tree for Fairphone 1 (mt6589)

----------------------------------------------------------------
Luca Weiss (1):
       arm: dts: mt6589: Add device tree for Fairphone 1

  arch/arm/boot/dts/Makefile                 |  1 +
  arch/arm/boot/dts/mt6589-fairphone-fp1.dts | 30 ++++++++++++++++++++++++++++++
  arch/arm/boot/dts/mt6589.dtsi              |  2 +-
  3 files changed, 32 insertions(+), 1 deletion(-)
  create mode 100644 arch/arm/boot/dts/mt6589-fairphone-fp1.dts

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
