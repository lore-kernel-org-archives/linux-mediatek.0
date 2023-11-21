Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64547C61D94
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 12:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zvq1L3qrO60z+9+NlymajsWGGa36ovjavLPOBw9MDV0=; b=p4trylJFpQ2IJxCCqgo+aR3Klo
	3rnnep7MghN3qYbYCCaQSBq7czQA7YpFUtb7SsOLBLLfa+qCvVY12w+L4RpzYLkqim9kVAL+B+8R3
	tepvzDV9v+n4xsADRvqM2udhAiGTzXtMbUQB6aCNHYtHt3twze3gsPfbFnv6yGdzVJ3E8sldAmTh8
	RCl8bhLxLS9QRJcy0Yfxehdt+a219bkbLc42jEq9Wc6WU01dZnTjvk/FjElwQ5SRIJ51KZ2pU6JAx
	lVlmqoZoNLdvb6AnuVVG9oCzGfAKACS1gcCNfJEqhgNvxQt/sgnsNfLDfJq8cAw1ggw/nlclUc+Ht
	pg3mFX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Q9F-00GjbI-0J;
	Tue, 21 Nov 2023 12:46:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Q9B-00GjaN-2P
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 12:46:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 30B0BB821AB;
	Tue, 21 Nov 2023 12:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A2DC433C7;
	Tue, 21 Nov 2023 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700570791;
	bh=Zvq1L3qrO60z+9+NlymajsWGGa36ovjavLPOBw9MDV0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Lr5y7QhnKA1IIVN3FzyVHj5533EIhg/AZBFEf0KBTX4lFSQN52jtsoNvAECK3M5tg
	 JCjxvxBPfomLo6GEvA2A7sLyiEjmXmMNuxJ6NtZuWIO8a8Po1BSpsemTD1zPzs99tG
	 vE485swaVZIAT1fbO4tsMDPHQzLYYE56IpUEgXL0G2G22xHATIP2ySJ5hx8BgE+LVv
	 MoUn6Vp3U9fN7W7lmJVW/JuV6o+SzGb3a68B+7v35VsVylPW4Nx5MfThZIkBs/7mht
	 i6yxBjywD/LHbEX5+rQpcGJKYuNQH1KUkZMC3VP8YQXC1oCUyYwDYBadF3Xbd3SKww
	 d371gdtiV/1eA==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
  "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,  Peter Chiu <chui-hao.chiu@mediatek.com>,
  Sam Shih <sam.shih@mediatek.com>,  Ryder Lee <ryder.lee@mediatek.com>,
  Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Shayne Chen <shayne.chen@mediatek.com>,  Sean Wang
 <sean.wang@mediatek.com>,  linux-mediatek
 <linux-mediatek@lists.infradead.org>
Subject: Re: mt76 DT binding: undocumented interrupts
References: <CACna6rwZ8q1Zoz4UAryipsZ90yVD86BrcTNv1yKyS8F4DXsuSQ@mail.gmail.com>
Date: Tue, 21 Nov 2023 14:46:26 +0200
In-Reply-To: <CACna6rwZ8q1Zoz4UAryipsZ90yVD86BrcTNv1yKyS8F4DXsuSQ@mail.gmail.com>
	(=?utf-8?Q?=22Rafa=C5=82_Mi=C5=82ecki=22's?= message of "Fri, 17 Nov 2023
 06:30:32 +0100")
Message-ID: <87zfz76zq5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_044633_947175_7A93BBCE 
X-CRM114-Status: UNSURE (   8.41  )
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

Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:

> I noticed that Wi-Fi on mt7986 has 4 interrupts instead of 1. See:
> arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> 300218b0503d ("arm64: dts: mt7986: add built-in Wi-Fi device nodes")
>
> Those interrupts seem unused by Linux's mt76 driver and are
> undocumented in mediatek,mt76.yaml.
>
> Can someone explain what those interrupts are, or just send DT binding
> update patch, please? I'd like to get DTS matching DT binding and
> passing dtbs_check validation.

Is anyone looking at this? Peter Chiu, why did you add undocumented
interrupts?

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

