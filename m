Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEE6C001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 08:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBhLFpKhZ3o4hiiP5yjg0rysTsv/HOx8X53A3uc7qqE=; b=ddn/FjjGo3uYNYR+9k03k8sbzl
	VPzmM66VsHbUuX61z+InQ552qKky4uba8TpPBZOdb+K4O1VFhwoF14OzTJbHu85yl2ptklExE+N+C
	83EziULosPUBiiljNYqYxpqJCgaQU3znS8h23svuhmXOb1rWPCuvKAtFjmgjpyY8Emglbe+Fryv7T
	HUTG0guNO/KQr6CBc+FC7FxkZAkN6q90kksw3zht+am8nKnepRKscSF5eYRWGi0vdzHZlW/h8j89u
	oE0VlBeAvysj68ViP2V2vIxGk7KvvepqElYNcnj2x0vu/xtRa+zEd9tvAdpMuxCgLhcJlQiMnkkle
	zKFHToUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqmt-003E1X-19;
	Mon, 24 Jul 2023 08:19:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqmh-003DwU-0V;
	Mon, 24 Jul 2023 08:19:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 497C26607029;
	Mon, 24 Jul 2023 09:19:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690186750;
	bh=gBQZn3CBVzSSUQuQhiQ/sMga7mNoQxmP14hkArh6+tc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k4qhWOQ0EpeQPuilqCex3htPrIbtXEuyKzFuqeiDk++TLGT0zZ0A13VZZqzUVJjQ3
	 mAEnwYp2wYosdzNioE2/KOTch9UhkDwZtorSJhIq+Ape1A749CB7liJkvjsjasWwYc
	 SFiFDEPVZ/O1gQu2MXb6oOfIf63k95YWn53UXI9sxVShhclTMZtv276AoryfId+qGW
	 Y7F+IlaB9ubURhixxnVjbq/KcKHrlWZrXCS6uRexGDDqn0/bMqMXhE9Ro3iNm6HezR
	 cCHyMkGQGLs1zZKDI3GatgII4XgwosRBB+muWg6riEUrO64lB+S1cgZF5N565070ew
	 ArrbxpFkgAMHQ==
Message-ID: <56e5f094-7032-ee0a-6824-3292f4b7c707@collabora.com>
Date: Mon, 24 Jul 2023 10:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 5/5] arm64: dts: mediatek: Add spherion-rev4
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230721201705.387426-1-nfraprado@collabora.com>
 <20230721201705.387426-6-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230721201705.387426-6-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011915_339637_CE68AE0E 
X-CRM114-Status: UNSURE (   8.91  )
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

Il 21/07/23 22:16, Nícolas F. R. A. Prado ha scritto:
> Add a devicetree for rev4 of Spherion. It uses the rt5682s audio codec
> instead of the rt5682 used in the previous revision.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



