Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809D2C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ne1aBBePrlHq/E+vPtBQxqp5bzFyFJ70egihBnu7bqI=; b=xLP52tTUxwFMEJjMNeQ4dmrYSA
	UsADz4tbRw4TSwlWaIKV1n4QANp4MiCxJ/LunfdcmloqTrmZbYAF0Bbq4p+JMT+N165nth57kAnHB
	bgGLKj7fBSA9G+HUXvgsT5+8Dzl2qsC8rcDgWX5JdClPvjp7P0CyFgeUuW34DFVkMZ8e743kmYEHI
	RCCMjayvFX+O5i7n46pmF+gfa6iZolzo+IlJtXmk9DYZeOhfbmdQcdPIKIFQ+CwBSgayBmEC7GjPD
	G2iRcBAoTFCqilt1UQ5h7I0EmH+Y7oNBbvfQZORVMqiuiMLoTUfsZq8o0c2XjrXEFydiEQ0K3DBKm
	K1EkrFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Rr-00673U-1W;
	Thu, 09 Nov 2023 11:43:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Ro-00671c-09;
	Thu, 09 Nov 2023 11:43:45 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3C10660747A;
	Thu,  9 Nov 2023 11:43:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699530222;
	bh=DG8lr3XMae8Z37XwliFHKZ7pVaHUuHV+P2yiDaz3Oio=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BCf56i/2+y3kfhSgdkJ0WVHPmfgOZYAPl/ndNlg9NVEq2TPiRjIJYnU+skFKe//UO
	 qdn6f3SlBvs29wO7gS9EEMFXGMvyivr+sC2Snr3n5VYoL131ouojvT3kf7scVQBxgf
	 1Wt/7vFk7tUdL/4B6GNUVEGfhDSXCOl0pAHdUaMfTQ1hNuEI/8zfUnM+yMTbpU/Gkb
	 vghdjRYF4N+o6sqCA+LBtkU+aPu8VEolXBLWkoZaAWRsf3jwTckIj66cZYLyGfb4WR
	 A8acdIiyk9oQx/w9kFKVRR29XSxjXx/SAPANomowA1EE5cCbv3ZzQXyfV86HXzEPqn
	 TbtaOnQbplE5Q==
Message-ID: <8ff82531-e2e8-4cdf-833b-ac964c1258c5@collabora.com>
Date: Thu, 9 Nov 2023 12:43:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND 3/3] dt-bindings: arm:mediatek: mmsys: Add VPPSYS
 compatible for MT8188
Content-Language: en-US
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Nancy . Lin" <nancy.lin@mediatek.com>, Nathan Lu
 <nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Garmin Chang <garmin.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231109111122.371-1-yu-chang.lee@mediatek.com>
 <20231109111122.371-4-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231109111122.371-4-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_034344_214846_49E49105 
X-CRM114-Status: UNSURE (   5.41  )
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

Il 09/11/23 12:11, yu-chang.lee ha scritto:
> Add VPPSYS0, VPPSYS1 compatible on Mediatek MT8188.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

P.S.: there's a missing space in the commit title that can be eventually be
fixed while applying.

dt-bindings: arm: mediatek: mmsys: Add VPPSYS compatible for MT8188



