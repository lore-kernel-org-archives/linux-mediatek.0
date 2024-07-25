Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA5BC3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jul 2024 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BDUA3g7qzdMr75+tkH81j14vsNLSoE6Dhwp2w2trfk=; b=xy/nBXhQEDJcxFUupsp6UQ8GUk
	EopQZIKfkE2Efz7PAIys2Stk/UlIlMzTgj1+gHwiKNO1GhEoal86WmgGrjrORB0TTw4cxh07AIcoE
	O+5Lf2N7JYqTe5rHfN/Lw9mGPiA19mOerJoUD7tTAL2+DQ5MT9jwzDW4RfeIzYd/oRX6MtT++kfty
	jhfuQsks/IyQLB2jDM9zUTQ93PAF7c7gNTwCk2QWyG6tNAaKKsleciomBzPM2dMOnnx6MwxTrT/4U
	D6YGRFmjohWJXedIsQ6Sr366gSjf8aRFj4TZnSnN6OEFfzmkCb6OYi8nsSJSiNB3EWpI8XTOwvpsi
	DEO6fDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWtFj-00000000EJM-04xb;
	Thu, 25 Jul 2024 07:51:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWtFK-00000000ECP-1ECn;
	Thu, 25 Jul 2024 07:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F2DF61231;
	Thu, 25 Jul 2024 07:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FB0C116B1;
	Thu, 25 Jul 2024 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721893841;
	bh=u7UE1luUcIiiCdthGpXJeT1sBaHmsNt8cCi8bPyijUA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=FzksCpuVshp8PjzNoSbGxFmNkc9kRIUDPZ1vIn8AhwSXjHozNV2STsSDKtk1mAb0g
	 AHoOm6RI0lWcOeLOiNrHHm09wWH1OtDN7ydaCvIU2it/o0XSuXSdvPH8AffZ8JSfmu
	 jnNpVySU/0AYcQEU4FKq3uZIyWtP4DmM0Tde5uu2mtht7iJOs0BoQsd5ZaTm/qYP2z
	 4uSUBuwUfi/IhG1YfrOZ01yiOqv2MNMQNrOxb8xV2KiWCnZdAxHh6x3eHhrX9XDWYP
	 8zragP0izeadLis5etSozk1fva1MUfcez+ADfcQbPvVcQSxVRpdjuxMoVuQhYIHWzO
	 jJq05RcISculA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240707114823.9175-2-krzysztof.kozlowski@linaro.org>
References: <20240707114823.9175-1-krzysztof.kozlowski@linaro.org>
 <20240707114823.9175-2-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 2/2] mfd: syscon: Simplify with cleanup.h
Message-Id: <172189383955.837660.943433218904558392.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 08:50:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_005042_403453_9A292536 
X-CRM114-Status: UNSURE (   7.12  )
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

On Sun, 07 Jul 2024 13:48:23 +0200, Krzysztof Kozlowski wrote:
> Allocate the memory with scoped/cleanup.h to reduce error handling and
> make the code a bit simpler.
> 
> 

Applied, thanks!

[2/2] mfd: syscon: Simplify with cleanup.h
      commit: c80c7dfec9d8514f1fcc34402124026e59d2e2cb

--
Lee Jones [李琼斯]


