Return-Path: <SRS0=Dmy6=IF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDFCC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 00:43:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38CA650B1
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 00:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F38CA650B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XxuYdwivymCUDAq91wNCClKjfQhdKoqbwL4xYl0PVXI=; b=DJgDAd3ZtbabpHrDyyGLCGNv/
	7NrYPjpRALQEPtIlTYQCwkvaCkegI3e81RWIA8lBJuQ0wVobqS/v5KkwNnDKmh8iBhxEMXImYPucn
	qe5ip4MLRUcwMSpQX4IW3qXnYJKzUPM9pB/xoZ2HJLsC4IVNBxmQ7EZWuImqDHp8i/tQ2BiZj6R/b
	prW4MvpAfcWmbf9bLEx5A5/zkJq/JWIbfGKU0s+jY9oa/BESvsT8iDOs0BFQdIaylXIq97XzR7tWO
	GSZ7Pgzrw6nFPdmqn6n4AXWIXBY+eGRYazxnSMyM4haFkf9VxFNY4PHJ5/MLZTiugLSUVC2CGaZEq
	o9VcMnTWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIhVk-006QWY-HM; Sun, 07 Mar 2021 00:43:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIhVa-006QRs-1G; Sun, 07 Mar 2021 00:43:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B2C3650BD;
 Sun,  7 Mar 2021 00:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615077776;
 bh=KZD3vOv3vH2mC1Q0ZplTlNxWU5cUbcMTjSyFa0US+0U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MzO4xfRz/R75vm/uSgcq+ZU75rGZekKhPNHoAZ2UHiBjgiKU4O+Nn/bxwktFoLVFu
 iTN9mENxTxEN7a6blOtoqs1OdTro3umc94005wwWt4g1o89NEZBO7xc2VAhCYb/4pd
 ivy2UieMfb+QewR7D2UrUSjbHSMQXRIi0JYXpuzvzC5gTfeVbtby+k3pvu+Tj3tyit
 WmUV4GJDijKzl9/3KkI7CzfoC7xSXgCUVWEKqP4WBWve/n44tfyDMohOMQfwpza0ai
 QPubm5uVRC9tVQz6+nLXNYN8jYQVrfN+gOVZ88lT8wkAXWYjlMzb4t7zny5MvGYj+G
 0pbjIisuLwCiw==
Received: by mail-ed1-f45.google.com with SMTP id m9so9051697edd.5;
 Sat, 06 Mar 2021 16:42:56 -0800 (PST)
X-Gm-Message-State: AOAM53370kiUf8s8/yHyq27V4Gs5v15qp3a63XjhM57ioCB9Fm4Rov+p
 ToH/kGODfW0SSP15vDxzpqD7fvdo0u+IJ8nvZw==
X-Google-Smtp-Source: ABdhPJx7jtQ0W73hZycPPbjKIcZbMY0MyE9EPc5BZE00JeOhpRPAnSbt16/1gZRtb+fIlfnNDBOeoa0ac6GIa4Mpr3E=
X-Received: by 2002:a50:ec07:: with SMTP id g7mr15611220edr.72.1615077774729; 
 Sat, 06 Mar 2021 16:42:54 -0800 (PST)
MIME-Version: 1.0
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
 <20210208014221.196584-4-jitao.shi@mediatek.com>
 <20210210201856.GA2690160@robh.at.kernel.org>
In-Reply-To: <20210210201856.GA2690160@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 7 Mar 2021 08:42:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9gQe1SvzyzeNSA+i5tQNGjuW-57vpuA=GusmtWX0+_1g@mail.gmail.com>
Message-ID: <CAAOTY_9gQe1SvzyzeNSA+i5tQNGjuW-57vpuA=GusmtWX0+_1g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek, dpi: add mt8192 to mediatek,
 dpi
To: Rob Herring <robh@kernel.org>
Cc: Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 David Airlie <airlied@linux.ie>, DTML <devicetree@vger.kernel.org>,
 yingjoe.chen@mediatek.com, stonea168@163.com, huijuan.xie@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, eddie.huang@mediatek.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, shuijing.li@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_004258_527010_1335A0FB 
X-CRM114-Status: UNSURE (   9.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQy5pyI
MTHml6Ug6YCx5ZubIOS4iuWNiDQ6MTnlr6vpgZPvvJoKPgo+IE9uIE1vbiwgMDggRmViIDIwMjEg
MDk6NDI6MjEgKzA4MDAsIEppdGFvIFNoaSB3cm90ZToKPiA+IEFkZCBjb21wYXRpYmxlICJtZWRp
YXRlayxtdDgxOTItZHBpIiBmb3IgdGhlIG10ODE5MiBkcGkuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCAgICAg
ICB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPgo+IEFja2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKCkFwcGxpZWQgdG8gbWVkaWF0ZWst
ZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWst
ZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
