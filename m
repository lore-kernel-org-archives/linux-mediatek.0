Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1116C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 11:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RqRV9jMyxeJa5tlrRo0yZ2QYoCAerFS+AM2gVyDC748=; b=zQ+e2o/q2gQiJ9FQcxm99QGmPU
	47NQGAF9RYb4Nmo3ym4W3vtvwSsYZg62P+8OcNIIgvvtiqNdGaVrAFMkOlQLaW5BHVdaC5cuOVJUF
	W9yAoVdwOp+mVjBhWL9UnvDAkpFB0jhUThP9hwLfDQwv0Esvo09nqMQgdVPFIMmOgBjIlFzsfgSjz
	q/tbwPvvnIR7gFPy70ZGbV4mad4XQfjTWBYKVNWGlLlRGl/pMvZABUeWt+S2zUKVwFjKryLyiF2oK
	YlEJCa6H4I5gaHhayv7lQGEleYD++FlVy4AstGKXDGxxJUtQYuN07nNq6n7jqik69gVu3q0xz7o8F
	hQJWc34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npTMb-00FkjZ-LW; Fri, 13 May 2022 11:21:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npTMY-00Fkhp-Qe; Fri, 13 May 2022 11:21:40 +0000
Received: by mail-wr1-x435.google.com with SMTP id d5so11017500wrb.6;
 Fri, 13 May 2022 04:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=ZUk+eLoJy5I+snd7UZ1OV529h1hWoin5n2Ec64oMRlk=;
 b=CWjH2j6UR1YBZZHb0hya2d6B6Q83DonodeGKRM6fRMECzhTYYB43s+iu1C90d365cC
 8Wa1px4trV3fPQz+pkoH4KoldLfsaX+0rzdo4BUpi0K/nPjig9vKx3FTo5j+y3hgHH/1
 wF/TjP9eASV2IvzyOr7SnIf8q6G25rr5RvqZHeSBwGLAk/ML0uw2zc1sK5oygt1o1Vu0
 AljwUwvVkxblV04o3/rkmjtl3Axo9weNCGU5lUfeUWFdjOvQ03RSBEKPxNZyF44BfTAm
 8sBEmtAmLnYhq0rGTC5kG3b656iz25C2MFrOiiVAL2Kmyt7fOddG5cphkNPnipXYaAGV
 eUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=ZUk+eLoJy5I+snd7UZ1OV529h1hWoin5n2Ec64oMRlk=;
 b=Onw8QMxan45qxYHOt0CmbN5qtr/pO0xBhPAhPMCzkUonmlYjTA5JWuf2S7yLYWEUpD
 8La2F+2URSRHC5WxOjtJfeaQfNajXHnrhhF5LTjHEeEnbYu2nMNrcWDxdC36X+RT54t+
 wB6cguu/tG+PNtRntwf7Z4gGyK0uYwksTefPnsbxVkp7fWLGAO8B3gqKD5zSHi8uSbas
 kF1z2D6sB66i4zi8Sc2sJojYj2cvkxVMn4wPQNNA0+l/WOfvHuB+m5uojTZy+mJnjgcG
 /TID8PcDAD6SxCuDR/HlobTIpLMf9InOQ1i0PuhzgyCFqSUawvwCe/YCW0nSOy3ntdMW
 SweA==
X-Gm-Message-State: AOAM5322BrI8CVw/ub9bKyKhVIHU2ibY0JnLaFhb0b1JsdMxxrdnvHrY
 yxEw/JzTEDofmEWExnX2iFntIQfagMRYPQ==
X-Google-Smtp-Source: ABdhPJxx2Vfx97P9L/8wqfJ9xKB60NGKEsgJOweCgR1hSAFuWPEuz0DG5dDxvs0OFl20spPi8KYfnw==
X-Received: by 2002:a5d:6c65:0:b0:20c:5230:f145 with SMTP id
 r5-20020a5d6c65000000b0020c5230f145mr3419627wrz.337.1652440894983; 
 Fri, 13 May 2022 04:21:34 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a7bc116000000b003945f955b51sm5059860wmi.3.2022.05.13.04.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 04:21:34 -0700 (PDT)
Message-ID: <b4383f23-0adc-b9de-a1d9-abd1c2f82b27@gmail.com>
Date: Fri, 13 May 2022 13:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm: mediatek: DT updates for v5.19
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_042138_927061_85EE41F4 
X-CRM114-Status: UNSURE (   7.58  )
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

Hi Arnd and Olof,

Please have a look on the below 32 bit DT updates for v5.19. Apologies for the 
late pull request but I got sick and needed my time to recover.

Regards,
Matthias

---

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.18-next-dts32

for you to fetch changes up to a044e6a0883bcd4ad71849c97f79fd213e940077:

   arm: dts: mediatek: Get rid of mediatek, larb for MM nodes (2022-04-22 
15:49:12 +0200)

----------------------------------------------------------------
Delete no longer needed properties of MediaTek Larbs for MT2701.

----------------------------------------------------------------
Yong Wu (1):
       arm: dts: mediatek: Get rid of mediatek, larb for MM nodes

  arch/arm/boot/dts/mt2701.dtsi  | 2 --
  arch/arm/boot/dts/mt7623n.dtsi | 5 -----
  2 files changed, 7 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
