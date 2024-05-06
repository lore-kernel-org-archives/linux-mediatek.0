Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B50C25B5C
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKFqiIuqmksD2hkTVjsXZzKzTMLSItRCnLQo0P6YboA=; b=15si8qw/qCha4UPwX/vNM4OKK7
	ZRmb/8xjpvCOLOV5TaywdmsIZ9auLPLvyQch0IU241E7/ihMvnvcSiJ03ifXtGKUTJepYIdctGjoQ
	PJMQFK1mO8WI2NyXvOwdXvuOhu9Dbl5B5Vtd1OO3j55DcTPqHZTzyVZJZ/u3XhjtoaRaqzF+RtVqZ
	LMae2HoX4zv4mFmp+AyF8YMf6fDBIVd9B6j/NknnuWi616bCW1Sv45TZRk8ZZCCV33m26Cr4IWD6U
	EIjlGxG1RHGzb1mc4qm3D7FCpf4PbbfSPwxIyWElsM8XnNbF2lad31ErgMyud+LOzSjY3qsn1A79T
	jjNtCtUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3t9S-00000006WLL-0ydA;
	Mon, 06 May 2024 07:52:46 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3t9O-00000006WJA-0ZN7;
	Mon, 06 May 2024 07:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714981956;
	bh=vaxxs/M5hBvQ8y2s2UpxySg17jKI9dQQxEa2rqW65Fc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kEPNrJhbGm4ZIYASKEr2O8XwgghSuwg6G3uq56sBacgttu3k/hqa8p7WbxQ+QbzUl
	 fW1oCyaHnwzen5uv16SiKHfHmoEOXiRTi1xwkuzq3xYF6QVIrS/AtEQMEQFL9aP9pQ
	 aSmIuOvZufCwxpmgad4159ZXz0SYIi9qqTA1Aq9Wf7+gUT6C9Ksx7kIC9nE9wqTLZU
	 uBEsd0KggHVQ99mtQXIZEvIsDSjGEA4pkaO1eJXUxQXRWOewHi2rmsM5mjK8WYixBZ
	 xFbI3XQb+nKvd/WMWqMlEv3WLEKjmqBrRDvSZPNQWzjLEhvLvXt89oSSMcb6fUnhTo
	 ixvfxC2m4pt2A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 788E337820D8;
	Mon,  6 May 2024 07:52:35 +0000 (UTC)
Message-ID: <aeba862a-0694-40de-8b87-a5f22ca88127@collabora.com>
Date: Mon, 6 May 2024 09:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal/drivers/mediatek/lvts_thermal: Remove unused
 members from struct lvts_ctrl_data
To: Julien Panis <jpanis@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-0-f605c50ca117@baylibre.com>
 <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-1-f605c50ca117@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-1-f605c50ca117@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_005242_517627_398FE6BE 
X-CRM114-Status: UNSURE (   5.20  )
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

Il 03/05/24 17:35, Julien Panis ha scritto:
> In struct lvts_ctrl_data, num_lvts_sensor and cal_offset[] are not used.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



