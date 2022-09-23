Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D95DECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4eQh0bhVORDvNeRKRka9yvHQmJH4vBx3Hho/53aF+4=; b=Pj2JeyngfiLJhUS2wYiyNbRduf
	Q5ZM3Baz27lwGLldK1i0YyNLIol5LkYp+iGVX8lE+yl/qbsyTPbOauW8zulPKUEgreK17KXKFOUFX
	QyiPHQJQZgva2OCusdLJDOzNlIuuggwFPJZgah5c2hrCVF18IJffP1WxYyj5WGpSYla7jeZBQfKRV
	B2jHIxUEXYJWSZK1Uxl1aDrow7yOxkeMkeEwDK84Hw/Sb1Vh8Krt3aO0gzPvcKDn5eMM4sezx9nyF
	zzzEigzR843jtEZoI7qG6gdlbYiKrecsmKLC29VKM9BWrSOUy4mjHG705Ic59J9zJQDQLJuUrUKU7
	yFwmCXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ober3-003GNH-Lm; Fri, 23 Sep 2022 09:20:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeqX-003G7N-My; Fri, 23 Sep 2022 09:19:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 555AC6601BDF;
	Fri, 23 Sep 2022 10:19:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663924784;
	bh=L8D1yTEhULRIAS6lI51HY0j9CE5jcl5Cm2AEs0nABTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PdlxoKsr0n4pUp6rXaoDv1z95wkQwSDLj9HW9GDDCwAMWLOUl9PsJd4qls4Cpb/zv
	 a0nz1P8zzsvcGgGVH0CDWqBUGSgyngy5l9j4nunNfT7s1nqZKct0uyoUSoVik5cPUr
	 +O4B0I7GsgWdV6H12y1pS5TMwWIX5c9j/ZUmjhbh1DAENlhoKJUtUF2/gLTFAGUspz
	 uS1af1SK84lFDivPwjqXIwHqBgtMS80rJIBXgCXnYEYuy9VD5Csxt3iHrjWayudeX/
	 ZsCHnKRrIWeHIc2b9er2iWh4Nx8SFdrUu4VakhREUKGspz5ZheGVbROEpK5V1dyLyL
	 lAfVid34fkaUg==
Message-ID: <b11fec5e-0725-be3c-4b4b-0e68bf00c10d@collabora.com>
Date: Fri, 23 Sep 2022 11:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9,0/3] Add dpi output format control for MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 jason-jh.lin@mediatek.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
References: <1663922440-20242-1-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1663922440-20242-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_021945_917579_DAE9E3FF 
X-CRM114-Status: UNSURE (   7.80  )
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

Il 23/09/22 10:40, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Base on the branch of ck-linux-next/mediatek-drm-fixes.
> 

Hello Xinlei,

I've reviewed v8 just some minutes before you pushed this v9.

Can you please make the requested changes from v8 on patch [2/3] and
push a v10 retaining the Reviewed-by tags that I released on v8?

Thanks,
Angelo



