Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F981C4829E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 22:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul5k55UQtWoQXPNcb/0pzT+j7IivOX8sLryDaU7Ct7Q=; b=QvLDkrV7ZlWiUQb3ZEQ4H5pwdF
	ky6a1gsmSziw+ZnIMUiSuUrA+dfR2UmTmk1dPluTu0ESE/BZv+w6X7r4Th3BexZszflp1zLh2o/p7
	5BYdqkD0B7EYq7X7S5VUlei6H3NNDuuZgQ6BUFa8AmecyCPM/gmCzH/V/u66nmdNuho2rPw91i8MA
	a7y2FdkCQaf1dxHUy5FVGbprEmnFWAOMOurjL3l9VZbS4fr3uSAWj6oTQKh53ZpMVwaMg74u1jXbU
	OZMWI1CP2KdTf8RH7+o9tvEoU86ZR3UFRLohcLTRMaOJMYRLQ6FIdU21Hg80oeEjwpMTpCnuSGalB
	hHBrzt5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfCT-00000007D5X-43Dd;
	Mon, 12 Feb 2024 22:54:57 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfCQ-00000007D4m-1nRi;
	Mon, 12 Feb 2024 22:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707778492;
	bh=ul5k55UQtWoQXPNcb/0pzT+j7IivOX8sLryDaU7Ct7Q=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=yB1EVfzhAXAG+w8ega+dSZ/swCbr2gPUETml6Hex/vwR5/C7CK1G6sWoB/LnAPMA2
	 q9cQYwIbYH8MAOIJ6fuqH1PTz4iKmpY3lcFeVynIBLGwJ1r4bFiaSTjmQqlEKl/YZN
	 RKAcC2RMZauWn8f6J6h1Lkmk5q5shIRogie2/NalnQ6DppWXa3Tio9UADKvDzbDwe7
	 dI6p+Nnj6ngDjxgBNbvlsC4ErC5LvmVYBov+/DO0yNk4mwP30qcThg+h6e2d6xfvsa
	 eulyaETtXwnXJWxgUNHqrWsO4c8O/tQHkkKkIRw7582s7Te+EJYhow3fUfpdThhjCT
	 j9xEaqlEFAmGQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3DA073782059;
	Mon, 12 Feb 2024 22:54:51 +0000 (UTC)
Message-ID: <088b7b48-075f-4e68-9675-38c0e1f4a560@collabora.com>
Date: Tue, 13 Feb 2024 00:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 02/19] power: reset: atc260x-poweroff: Use
 devm_register_sys_off_handler(POWER_OFF)
To: Andrew Davis <afd@ti.com>
Cc: Sebastian Reichel <sre@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240212162831.67838-1-afd@ti.com>
 <20240212162831.67838-3-afd@ti.com>
Content-Language: en-US
In-Reply-To: <20240212162831.67838-3-afd@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_145454_605438_142AD66F 
X-CRM114-Status: UNSURE (   4.61  )
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

On 2024/02/12, Andrew Davis wrote:
> Use device life-cycle managed register function to simplify probe and
> exit paths.
>
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

