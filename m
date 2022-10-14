Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8673BC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+nYmi8WmtFIl+tXaj9TdH76fe1m9XLMQrCYgbNQWpo=; b=dTQYaMqLC+gVFw++J0rdbydU7j
	6dziQUWUfsk6LS+P3+NmV8wSgHZZhF6zzbCILIzqEclyndpkLGJiKB0mNas4WAMi6+aVP98D5TLKi
	ufn30iQMkS94aEVCaak5f1Zw+XXLiMCeuQ8Y6r8SfmJevNv4C3y38uO/Qrzr83OEXUI15b4DmoY5/
	TvDdGXE5hfWJyOyE483lS44CWwY+R8TTSQl+CbQyBa3EYgopC2P76/iSSnZHL+58WlsfU6wenM+og
	b68ZI1Sk+3JkwGp9uLZJM1iT9HpvUv7+40+7tfBfgYi61R4MZzp7rsCG+S4my+2Ffgx06ZkGk5KRE
	7Eb0iMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojHxU-00EQF7-Fh; Fri, 14 Oct 2022 10:30:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojHxI-00EQCC-UN; Fri, 14 Oct 2022 10:30:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 355946602375;
	Fri, 14 Oct 2022 11:30:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665743411;
	bh=6L92KhTI3HHyC9sYJgk4N+q+nYhrAq6X4Q060GaWgUg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yl0HDSJdvksMkC+OgWrxdQGHbzwV1bbWfJbe+/aoc7oiXV5cLsK7LSQQt+TkBzgzC
	 H652/DSoMWqM+73qpo9QSXoVg0sywrUqtH48e/8Z/De7Uf0NKCDXChKzrglo41Uuft
	 O+VCrcBFME2gcS6knyVcooqRXxF3CEewTlfQilejZmSmTC6Z9Xxo+7PSUhXpJnU5Vx
	 WeLJ2/JNLuQVPNRbPqLQSh8Wok1uNmZximH4QzN7hiIh2etNl8Aq2LjA0UQUvhOlTf
	 eSCDVwgFfkPaBJAwcUjYQ1PSH7ukgE6ZXLxgg79ARmB+WVAHoYE6xp9SwEMrxnx459
	 4COvF36tVoBjg==
Message-ID: <4e89e401-ae10-f8c2-07c5-1cd7950f3e27@collabora.com>
Date: Fri, 14 Oct 2022 12:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] soc: mediatek: pm-domains: Fix the power glitch issue
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
References: <20221014102029.1162-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221014102029.1162-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_033017_217340_5724E487 
X-CRM114-Status: UNSURE (   8.62  )
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

Il 14/10/22 12:20, Allen-KH Cheng ha scritto:
> From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> 
> Power reset maybe generate unexpected signal. In order to avoid
> the glitch issue, we need to enable isolation first to guarantee the
> stable signal when power reset is triggered.
> 
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



