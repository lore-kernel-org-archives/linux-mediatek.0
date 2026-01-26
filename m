Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0EFD19503
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jan 2026 16:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzIM5S1aosasnRgv4fpJy7hXx99GJuvBk4X/AumVJ6E=; b=TM/yXqyRBH+iQKpKqk0DFliNHc
	LGlobAvMSmubBlUITrepxmg2szA2NaYE7JEqtQPwLmpnhLKykjFVllGv3hjciE3ksti0bSUmFkMAx
	hSA1WkDZ8FWuJ/5gz5U+r2BXvTsSTISwubweAfGXbDxpeiXqegeP7vrAIOSj3bBoRcXPTjcFTAC/W
	k1m0nSzHdOa7Ee6iGvm9zt+1so9EYaFgeSIduiM4q7S8ckIl3kaWZqXCZBz0E9YtGLgvVlKZgerXK
	EoKS3bZrCJHWt+CgkzNFCrExy/ThqNVvsRWfIA0XyYpGpDeDVybMTK8vLKLwL/xgmg3jqqQsRlckK
	sCz6AGCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPmM-0000000CtXN-3xDN;
	Mon, 26 Jan 2026 16:49:30 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPmK-0000000CtWf-1jJ7
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Jan 2026 16:49:29 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-78fba1a1b1eso70486647b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Jan 2026 08:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769446167; x=1770050967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzIM5S1aosasnRgv4fpJy7hXx99GJuvBk4X/AumVJ6E=;
        b=EeWiMQ2M1BPLeoVJfnnEI/dtrlZB6M4+XDzxHJwAunM4pn5Pe8Dlkv8rVG1RKvMfos
         QxSwU70gx1kS1zvrJNFrPz3dAqd6RAz3GMfU+a6cDuSy0gJP91bD6KkPjMMx5LetgUNk
         fWfxm64ArbGbWSLH18raIOgtScZij07JGqyjO7X+ovcT9UqKaPABiNowpNgVqPfV6i59
         iisLNO3WYgOzemeHIQkV/BYfVKzpBvy6Txv5xWe4Exk5kWJzTiR74Fs9/q5Kv4bmXNv+
         UNP4hbirh/NgsxZWm9Qscn5YFoVnpPFLRCQCLDk2HJZ1/DZfulJ5FdlUJIpZz0gPoy+d
         YF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769446167; x=1770050967;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CzIM5S1aosasnRgv4fpJy7hXx99GJuvBk4X/AumVJ6E=;
        b=ptqfc/dHtjxytmV8o+vVzWvVJOwAi6bWPxzuUx34F+pRRystVyIayxOQRg1UmeJ6Gx
         0uzgZk6VG7/Q0PFY0gLT0YFNXwW7E6fjrlZencXt2l1//Xe+FqZVkL3y+gGqZjRLbB9Q
         do/DAUd6FkH+oGgcV5MkMsrTe0bfLxLFTqathP+OS4Qy9yTaeZsONfWoU8fIeWnhF+BB
         8fV4M0liF1JW9aSH4ZRsysq0qpr1nNae8qh0Ge0Ed29J/3xHq/B5h4u/aOBptRpkp7IK
         NTY7/umhlgSXOjWCSl/omlFrz8S4VQR3DjKyTaFLXOif5OgjpSgr22EJqBdE5dSsX6tI
         8yCA==
X-Forwarded-Encrypted: i=1; AJvYcCWm4pXWlKSMnXYcRlAJAF/m2XOtawM/12HdtowBSuCuozXskl8D462jjmmu6qeuDozwq52nx93SmArSHapJyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVdUjCURhjwNzG1ZSMdXou6PUcRWeI9iqzdD7gigJeOLuXLbE/
	ZIeoXKLtKgOf2e1h14asS03mgRtHRXMmumfd+9/smCNBMEbMz4JSqBiw
X-Gm-Gg: AZuq6aKyyDDLY9gyZR732aw9izWCoSFViP+yszoTv7cG+iTlcXVDoe8N+/0w69I+SGp
	MLRMlfwlBpDZ1fRCVrP58Ev8e77uaRS6n5PENKhROvLy2tBpHRgQVaVnuEJ+GdYhQHQbliUtzb5
	cqFogSpG5kvQkeZluV91E0DxrACD6leAIGtlLhVFpIuDn+loT50bMIJ1P6GN7VR0LUpE9+AYig8
	TVRZ7jxa83CF3BqbmcmGd1hYydDmoFlrd3WuzmOmCe6X1wUOHXbhUMLdeCcd797DmF/20p+y35n
	ThcvkP6QAjOF85pqwEpPw09sPXF1KwJ1O3RVlQ5F6U77a5KmtqHxrjTL/XdTzMaZp/WbmBlcjA8
	sZMzl09lySvzm+PhnqZDfm9W5TQ0IYY1zXulPvLRdcaWAIn6LIIVOGOOHrqdLqqJvyhDtBUxL0M
	W9tjH6vm/tbW+IienAUqA7Q0fAY6vMkAkQaUIJzaitw/sA45LhfEgjnKXJvaY=
X-Received: by 2002:a05:690c:6809:b0:794:107f:12b8 with SMTP id 00721157ae682-7945abe5d41mr35771317b3.10.1769446167253;
        Mon, 26 Jan 2026 08:49:27 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7943b2b9bfcsm49990507b3.38.2026.01.26.08.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:49:26 -0800 (PST)
Date: Mon, 26 Jan 2026 11:49:26 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jibin Zhang <jibin.zhang@mediatek.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 David Ahern <dsahern@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 bpf@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 steffen.klassert@secunet.com
Cc: wsd_upstream@mediatek.com, 
 Jibin Zhang <jibin.zhang@mediatek.com>
Message-ID: <willemdebruijn.kernel.11a4b80935127@gmail.com>
In-Reply-To: <20260126152114.1211-1-jibin.zhang@mediatek.com>
References: <20260126152114.1211-1-jibin.zhang@mediatek.com>
Subject: Re: [PATCH v4] net: fix segmentation of forwarding fraglist GRO
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_084928_464326_3B669F1E 
X-CRM114-Status: GOOD (  10.70  )
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

[PATCH net v4]

Jibin Zhang wrote:
> This patch enhances GSO segment handling by properly checking
> the SKB_GSO_DODGY flag for frag_list GSO packets, addressing
> low throughput issues observed when a station accesses IPv4
> servers via hotspots with an IPv6-only upstream interface.
> 
> Specifically, it fixes a bug in GSO segmentation when forwarding
> GRO packets containing a frag_list. The function skb_segment_list
> cannot correctly process GRO skbs that have been converted by XLAT,
> since XLAT only translates the header of the head skb. Consequently,
> skbs in the frag_list may remain untranslated, resulting in protocol
> inconsistencies and reduced throughput.
> 
> To address this, the patch explicitly sets the SKB_GSO_DODGY flag
> for GSO packets in XLAT's IPv4/IPv6 protocol translation helpers
> (bpf_skb_proto_4_to_6 and bpf_skb_proto_6_to_4). This marks GSO
> packets as potentially modified after protocol translation. As a
> result, GSO segmentation will avoid using skb_segment_list and
> instead falls back to skb_segment for packets with the SKB_GSO_DODGY
> flag. This ensures that only safe and fully translated frag_list
> packets are processed by skb_segment_list, resolving protocol
> inconsistencies and improving throughput when forwarding GRO packets
> converted by XLAT.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Cc: stable@vger.kernel.org




