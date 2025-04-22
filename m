Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A150CC369D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Apr 2025 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NM+RQR2zNrIGqRtB6a4x6clM6DGTdBiyErR6at62AvI=; b=ftSeT9jnu19HCr
	JVQ0bogUMOoJN5g01Whpsavrz0jrtC1+zl5LAepSB+38jItXeg+upmdbf6XvDCx+c7ZJF98LTzRqv
	WD0QM72Nkfv+c2GOABb13vIoamfceSzgFVJmzEu6RV9fkDqV0bPpX10RDoO8pWgGlGsiRXZXZ6zOT
	egNdA6lZD3QiVDLokwP9YTYKy/dFjQuLFJfz3396azPfZshhTiFek5Ud7HDC7qOy0LB4WXTvvOCFq
	gEpCyUzJqqxl413rTq3n6K3OYH2Lm302RMul8psJd5ce6F1ks7aQlVFxyQT9lfnr7RPZuJpZj7yQz
	Oj1EicQ1T/qaOxZVgC5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FFB-00000007dmP-303Z;
	Tue, 22 Apr 2025 15:09:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dis-00000007JKg-3w3j;
	Tue, 22 Apr 2025 13:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NM+RQR2zNrIGqRtB6a4x6clM6DGTdBiyErR6at62AvI=; b=Ph30RXafQCxkq431t8qCHax8BM
	bz4lt9lseM4kboQLd9cwdZArZT5QNV2e3vi9u3IfttrLtXBzAFnrfJkUMJ9Xj5QgKZ17Q4mVqBreM
	NH/QrmV/cftl54SmuAZ1OWNryC95yu4OfKRDzHUCSl9hKpb5M6aMPstcR7YvxTjLhNk/LZlgzwHl1
	XBd9Gv2y1sJN5H3WRokAs+k/dbqZIliJWgshrlvBsRs7k3qxXGcfAHl2gWuOEyip+OjjmiXs7PUID
	Z8+SHc6fJ1iahTzRsrvy/HpzYkMuolZWeBfN1X9h/qbiITzQHFT4T9q9UrXhrQ3JVzJLk4/kR7Pv/
	yaxga0FA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7Dip-0000000BEZa-3bNK;
	Tue, 22 Apr 2025 13:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328690;
	bh=zs2GEiCb2Fnzl5vqBIYKuQkKO6GU8T3Nv0uk80WaFIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oIoPM8AYd3Kgm35rvmA8nVpIiWZvgA++wJIp9kVJvR9m/G9PvWp3lEP/M75hoYSu9
	 Jn2dGOydXQmq9oot3mrHTTxt5EfZ47SfSKwGwh2U3BKJV+qPk5YJpWFQWDIHWhKDEv
	 Ol5nd1F0bAupMEPHeglavBRDSHWEUGllJDk1BgycASRsZS+3kf9e1eyvcZ2rMZBfX5
	 ahf2syRpCk/uFFSL7Ue37GcCzhimOmeMYuSo4/a9biQ7Qe+AVxA5iWmtvmhRysEuVk
	 29sEbmzEB6Daga7SZ/au3q/4XEWZMOeoPCpZ19Zus7CPTyBqsNO9LCcjDe+mrdPUfc
	 eh+sIII3PyNhA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDD7417E35E8;
	Tue, 22 Apr 2025 15:31:29 +0200 (CEST)
Message-ID: <16d6740d-5a94-461c-941f-243fb1aefa92@collabora.com>
Date: Tue, 22 Apr 2025 15:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] dt-bindings: mfd: syscon: Add mt7988-topmisc
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_143136_082205_AF803295 
X-CRM114-Status: UNSURE (   7.29  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for Mediatek mt7988 topmisc syscon.
> This hardware block contains 2 functional blocks
> 
> - a powercontroller which is not needed (switched by atf)
> - a multiplexer for high-speed Combo-Phy
> 
> This compatible is only for the multiplexer part.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



