Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85733C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wReGMAKMp6OYy8B/4+ZNGo6FI5+NXfeuvCHiUOCI2qE=; b=yxbjU2f4cPc/vpdc6hrGFJhegP
	wJp6rYYtuhHiTPqtMqYRBi6JmS27JlZeUyfBZNDhPutbOIKq7x4ZWeLMTGhY9jnkcuPUGAk7H9bhp
	wmT4aucWCk1m1dMfnwrpwJz7HxWmqGBPscDFV1qC0Xy0UluSGhpAh2HzRfrWMSriMMkzR1YastTKL
	fuHFDAzk8b32gbEW56WVhTCxYqidtl1D9EeIMVhZL0bWcf59N6+QIkO5ctTqO+CVKCEmXkrAXJaWX
	SHUdgxRF8bJ/AvoMuJeDWVYVXsnWRbjTrOejMj5rgSPPEoJzoC6Y8ZZKxwNjGw3hQ/ZYDDbH0mU99
	WUKR+iUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofL2t-005qif-2e; Mon, 03 Oct 2022 12:59:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofL2p-005qg0-H9
	for linux-mediatek@lists.infradead.org; Mon, 03 Oct 2022 12:59:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id n40-20020a05600c3ba800b003b49aefc35fso5786172wms.5
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Oct 2022 05:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=wReGMAKMp6OYy8B/4+ZNGo6FI5+NXfeuvCHiUOCI2qE=;
        b=c0I3wNcRuakFlKzouuEX6OMYaKfU6XQQRaQ0ZnME2zVpz1Br8DWYJorCOHVTn9TXde
         AXlJ2AW7wEqcrVT5QOdQ1VbWo94+Ymeq70HIq17qhEFOv1ulPS+yZZu/U6WcA8NmVZeF
         EYXimpCPZcWS49GmmlTk8vSjKte1BXoZbqiVlb0QJ5pvp9gFT3f9NJv7rW9DsvmE5h5E
         dQvfV9IYWenflPVLdgLnh0mgYwKzkYkwHjLD/usFUFnW1+9JA2zZzLSG5feJ/U2v0nji
         sjBi11p/qZj16dBpFfFRsdLE7vnaRqRK2c2fZXs2IAuDAL3P9onb3vCB+R0c5WQmF4I8
         wPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=wReGMAKMp6OYy8B/4+ZNGo6FI5+NXfeuvCHiUOCI2qE=;
        b=J5huYsXhoY82Idn256/vkaqqQaBpy9OILmJJCvawBtnDCL/6SO6y6xl2Mr8AhhyrDb
         0wMHg1VdQa8WYszO5JmQbOzZQiAcPdPwEVCpSD8Ti4vn2mTleKrch6OYTQCn47T6yq6B
         5EtgoPZBB0nTQfin+Egv3n0dDTdwRthwl/JaJ2SrlnEATUuu7vFfepbBZrswB1G5blwv
         Un12ev/eC6ZEqwcK8o5wnv5LVL7CdbZ3LEdYBYbB4KJNNQM01po/BYO4Hb3+ry9inFSH
         5Hk9+A5YrZ0WZx/S2LQmtjYsLD7xdlp7GIixKZ9wx/avudElKlC9BY8COlqhf3QvgCyW
         UuVQ==
X-Gm-Message-State: ACrzQf32h3sginyXhGMZfIPm3xJqySDqaXVyjnd+z7/rlCobQzGOrm90
	QccL0RL6IdHHSXLtEQHBxsAMrw==
X-Google-Smtp-Source: AMsMyM5xjjntYl3OKKfThTYZ2VSh3sUFr9vL7WZJxZ+2kaHDV7ParuueGxHgxUjuqRnya5atrzegyQ==
X-Received: by 2002:a05:600c:2050:b0:3b4:a51a:a1f5 with SMTP id p16-20020a05600c205000b003b4a51aa1f5mr6544098wmg.177.1664801974290;
        Mon, 03 Oct 2022 05:59:34 -0700 (PDT)
Received: from [10.44.2.26] ([81.246.10.41])
        by smtp.gmail.com with ESMTPSA id i7-20020adffdc7000000b0022e3d7c9887sm3079375wrs.101.2022.10.03.05.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 05:59:33 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------lLmiDCqEGb7cAFUX901S08i0"
Message-ID: <6cb6893b-4921-a068-4c30-1109795110bb@tessares.net>
Date: Mon, 3 Oct 2022 14:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix state in
 __mtk_foe_entry_clear: manual merge
Content-Language: en-GB
To: Daniel Golle <daniel@makrotopia.org>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Minqiang <ptpt52@gmail.com>, =?UTF-8?Q?Thomas_H=c3=bchn?=
 <thomas.huehn@hs-nordhausen.de>
References: <20220928190939.3c43516f@kernel.org>
 <YzY+1Yg0FBXcnrtc@makrotopia.org>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <YzY+1Yg0FBXcnrtc@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_055940_180576_A02ECE5D 
X-CRM114-Status: GOOD (  13.49  )
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

This is a multi-part message in MIME format.
--------------lLmiDCqEGb7cAFUX901S08i0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 30/09/2022 02:56, Daniel Golle wrote:
> Setting ib1 state to MTK_FOE_STATE_UNBIND in __mtk_foe_entry_clear
> routine as done by commit 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc:
> fix typo in __mtk_foe_entry_clear") breaks flow offloading, at least
> on older MTK_NETSYS_V1 SoCs, OpenWrt users have confirmed the bug on
> MT7622 and MT7621 systems.
> Felix Fietkau suggested to use MTK_FOE_STATE_INVALID instead which
> works well on both, MTK_NETSYS_V1 and MTK_NETSYS_V2.
> 
> Tested on MT7622 (Linksys E8450) and MT7986 (BananaPi BPI-R3).
> 
> Suggested-by: Felix Fietkau <nbd@nbd.name>
> Fixes: 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc: fix typo in __mtk_foe_entry_clear")
> Fixes: 33fc42de33278b ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: rebased on top of netdev/net.git;main

FYI and as expected when reading this email thread, we got a small
conflict when merging -net in net-next in the MPTCP tree due to this
patch applied in -net:

  ae3ed15da588 ("net: ethernet: mtk_eth_soc: fix state in
__mtk_foe_entry_clear")

and this one from net-next:

  9d8cb4c096ab ("net: ethernet: mtk_eth_soc: add foe_entry_size to
mtk_eth_soc")

The conflict has been resolved on our side[1] inspired by Daniel's v1.
The resolution we suggest is attached to this email.

Cheers,
Matt

[1] https://github.com/multipath-tcp/mptcp_net-next/commit/7af5fac658ba
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
--------------lLmiDCqEGb7cAFUX901S08i0
Content-Type: text/x-patch; charset=UTF-8;
 name="7af5fac658ba05d4f5ba19fa7e054aa4ef917128.patch"
Content-Disposition: attachment;
 filename="7af5fac658ba05d4f5ba19fa7e054aa4ef917128.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWNjIGRyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19wcGUuYwppbmRl
eCA4ODdmNDMwNzM0ZjcsMTQ4ZWE2MzZlZjk3Li5hZTAwZTU3MjM5MGQKLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX3BwZS5jCisrKyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L21lZGlhdGVrL210a19wcGUuYwpAQEAgLTQzOSwxMCAtNDEwLDkgKzQzOSwxMCBA
QEAgX19tdGtfZm9lX2VudHJ5X2NsZWFyKHN0cnVjdCBtdGtfcHBlICpwCiAgCiAgCWhsaXN0
X2RlbF9pbml0KCZlbnRyeS0+bGlzdCk7CiAgCWlmIChlbnRyeS0+aGFzaCAhPSAweGZmZmYp
IHsKIC0JCXBwZS0+Zm9lX3RhYmxlW2VudHJ5LT5oYXNoXS5pYjEgJj0gfk1US19GT0VfSUIx
X1NUQVRFOwogLQkJcHBlLT5mb2VfdGFibGVbZW50cnktPmhhc2hdLmliMSB8PSBGSUVMRF9Q
UkVQKE1US19GT0VfSUIxX1NUQVRFLAogLQkJCQkJCQkgICAgICBNVEtfRk9FX1NUQVRFX0lO
VkFMSUQpOwogKwkJc3RydWN0IG10a19mb2VfZW50cnkgKmh3ZSA9IG10a19mb2VfZ2V0X2Vu
dHJ5KHBwZSwgZW50cnktPmhhc2gpOwogKwogKwkJaHdlLT5pYjEgJj0gfk1US19GT0VfSUIx
X1NUQVRFOwotIAkJaHdlLT5pYjEgfD0gRklFTERfUFJFUChNVEtfRk9FX0lCMV9TVEFURSwg
TVRLX0ZPRV9TVEFURV9VTkJJTkQpOworKwkJaHdlLT5pYjEgfD0gRklFTERfUFJFUChNVEtf
Rk9FX0lCMV9TVEFURSwgTVRLX0ZPRV9TVEFURV9JTlZBTElEKTsKICAJCWRtYV93bWIoKTsK
ICAJfQogIAllbnRyeS0+aGFzaCA9IDB4ZmZmZjsK

--------------lLmiDCqEGb7cAFUX901S08i0--

