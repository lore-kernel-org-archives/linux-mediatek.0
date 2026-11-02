Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A13B606A324
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 03:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0h/vk7oi;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mgm5SMKz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=; b=0h/vk7oigVurJt
	THQiy7WVTTvF2O5v/1IUqNwZlPR6Czr0KXHeRYsy1ai/Qpl8+MA7xetq7Pjfn45L8+xNKTGqFoBCj
	6sHeIIlQTtdbvxZkP+KU++LdxO8qNwgAcK7H2pniWt8dvz70/o4vC4D5JPYXTH3JESGjFZaKr+LCa
	ZgR+e8XfapTUMOhQUOzoWx7YHoQ9nE+5ykRRKj8b8D9C3bs5OHhtJGhp3ySD2t8gwZGWOFeH7tMDL
	MFslr3QeKt1KAZEX51DohxxdRrYx7oSB2g2kPYoT/BVnWA71WAMhFkpYhFK+IbluIsoxcBynCZBYd
	XvTvayXYnSDSfb3LiJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNilh-0000000FSDQ-3SAU;
	Mon, 02 Nov 2026 03:31:33 +0000
Received: from mail-oi2-x0b.google.com ([2607:f8b0:4864:32::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNilf-0000000FSCj-0Z7G
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 03:31:32 +0000
Received: by mail-oi2-x0b.google.com with SMTP id 5614622812f47-539d2baa897so1043541b6e.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2026 19:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793590290; x=1794195090; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=;
        b=Mgm5SMKz/zPhykmGf+e8pd9elbWN9EqoRG3LbdYWlGlev5ru3NgLyc2cZcnuOX0bbB
         BV7xz3O09Cbf4z5EBxHo2eyCwrvOKbqtY5f9HSVYihagYBbG7znsIZ1Ja4bN/+UrVzQ1
         bMADQ1V2ZkUrRqehwCCUB4osv8IaIHG1YvpFpDkCtaf2j66xXoh30XjKbSezaMCYj8Fj
         GVaCeSM1lRxijwPja/GdBMyAehK9pahNv4BD/WIGdjy5tLeJO31tcktrBR78MLL5gs6X
         Q9ih0dFdrxFQmN+Fnu/LYXH0hVEPTCptv7rviZNnhiNBJc4SKy1OswkwTyrBfGdS/iny
         vG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590290; x=1794195090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeNzVZpMqNVkX0vajF12+RTJyTWzweU/XK8AXxHx4rk=;
        b=o/oIbw9NOQJKIov9TQTeXGIbU3OHq7xTQKRcCU0j273c4Xj1kVkqnzOwMEiwByLTQ6
         yZlUTDMbR8b0LuXIknCw7441mheX3fGm1Q/IMUoME1T+ru1CWd1NLhxo/g4dBw11R/w8
         WzsXReZD8yRKfMrSlogXs/bGbW8KhWrtg03X1NZ1KZaeubbFPuKvAPCDnhDsATrcb2ai
         7gVr583ch9ZleY3beiuoE4qAOl/mfLGRcjKSZ+wmU+otFODQ5yIUuRHmzPra0CVB1cKw
         Pj4LCmwumcHL6pnihnrhjqjt4mxetUwtn2RPm9rBU5PNgmAOfn9/ZuQix9RCVCQTXjbS
         sZtg==
X-Forwarded-Encrypted: i=1; AKwUvBxUaixu0IAyfblVmsLKL5MXnubnbvKcR4Mk4lGC2aZXNq11BJQslUOk7a3RGmSgtZ7xyuwXRK/wBAE1/HHFPQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKXidQcQ1uCxBJF4JLyALh3zmDDf7hCW0LN9WxXPq2KFt983Pb2
	k2MV1pXO3stb3MdLmEGRmt5VMaGzcN/Qu79Ag3KU66bZY78HrTBel8pm
X-Gm-Gg: AYBFou0ebb2ZDMeCLl72lyHRxYxe7ZxOkTqk4FdlmRd82o6jhl5BTCYWtzY8HyTfcBF
	FTz5XTOVA7m97ZYztO9pq7Nrc0O/BiPINTo8lSZoWzYsGHb6eswZm2ThF0cFrBEU9RDMsRZXGdJ
	DaINuUOzK/DvZ1lYK/lh+v4Lc9BdToccjYaky8qy23x/s/IrsXctxB7wx1Ipk8BIwoG8sJmt02J
	kI1pwvIoGE4tTOS7sWfLUNah54XSWGpNPK3sc8ugH/8ohjfzD2pggtWL8J9ITnTvqp0irg6/3i1
	Th++Ij+SPSj/kAknIE3h2ycZZxZktoW6M0QvO6hHAcyZifJufFf3akM+NuLjPf80VU+febjiXW1
	GraT2cEQo2k3VBrPRlt5yXq/Hkv2oQrQD3Hlc1/5TlZF3p8ZMkEz7rajD1yGxh7v8ZYdpIBWN/U
	a9NIoqEAm7AAB9ICQ0P3WyhBgy6bE8P6BZf84/8sTU0Kokm3eQtdcFucwUb9dVxWI3NXCU5xF6H
	GlTZo1JQM+aOaYpEDDtS93o/FGKRoutnmHw61xul55xrL/sRZ/KJuXhWkaob7hQm7QLK79TuXuJ
	74pl1MrROdDaX1tLPMa+OVIbIeQDju+Ve3Xu5cUTuHDuCyyh2uxH91ImEt/IdIBbFq0=
X-Received: by 2002:a05:6808:1a21:b0:4f9:46b9:e80b with SMTP id 5614622812f47-5640d92b74emr5304782b6e.5.1793590289815;
        Sun, 01 Nov 2026 19:31:29 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49923sm6895225b6e.1.2026.11.01.19.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:31:28 -0800 (PST)
Message-ID: <f98c2746-a025-4a13-9e6f-2ed9fa183fad@gmail.com>
Date: Sun, 1 Nov 2026 21:31:27 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
To: Jerome Brunet <jbrunet@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
 <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
 <e8389c1c-e858-4171-adff-5bd94909120c@gmail.com>
 <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <1jy0brgpez.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_193131_190556_6AECA7E5 
X-CRM114-Status: GOOD (  10.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jerome,

On 10/21/26 8:21 AM, Jerome Brunet wrote:
> Hi Ryan,
>
> If you do not see it in the clk-next now, it means we missed it and it
> too late for this cycle, sorry.
No worries! I appreciate the response.

Angelo, since you're sending the MediaTek clk pull requests from this 
cycle on, could you apply this series and the mt8173-mfgtop fix [1] in 
your first one? I checked that both still apply cleanly to -rc1.

[1] 
https://lore.kernel.org/all/20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com/

Best regards,
Ryan Brue

