Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C4ACC6B1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 09:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=; b=VRdsECVmL4mjrWtKZIS7MVN4KK
	epMJSh5ggpg8C7CKzCkUww5ZNm3quAu9aZ0Tn52/uWW9J08a20lG/J9P768EFPl0RmQ06rcvssQqF
	7lDlmJZ+1Z6sGBOgbcWxFgaNXRW2rmjYr8IuR6Yhsr6WLsB3m1pVacCyAB1+UGfOUrqblYt8rwnBt
	3q9sAhPfSXAp3F2K32F0yxG1CWFz/5bufYjrQ+X2tQr6a48A2/OPChE2tPJotIT4s9Pr3sUq0HVPH
	YudekrCm3k9BtAY9cNqu0oO32tBUxiNzZtmG3UoVX8be1GROV590BH+jZ/MLlRDbENFYTh76lIK4c
	JSGQ8TeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvYW-0000000F6fO-1CEv;
	Wed, 14 Oct 2026 09:45:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvYE-0000000F6bb-3lu5
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=; b=CDKb+vy8emM5/Kr6Zjzt5e/YcJ
	DAzxvls/yLRSbMhk+umWdcal9QXMoabLCBXjiJ7C1olb9VQcFbz/1BWjwb6YbfMvqWgjlAD6kR7wq
	xUcz2PRl1ssEZJhb4VlZZ1vVdkBg69EYcP+NJNe6gecKKo34ldx43ODuUYwXfPAlY9gzLblZrOrAK
	sF+iSD9O8xu0CNjBM0vMhz1QBZn1wr4MNNSibOTI/T3QM+ecaF+Mvb22ZtDXcmqh64+keNHLRa5Wy
	YvNMpCJqzPIiQ/dLE4lgrtBt+adHDGGSK0EetP9D+2lvoCm4cUERdS7BjkIxTdR+g8UDtUaE9b4fU
	3IzaVc3A==;
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvY9-0000000GabZ-1a95
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 09:45:32 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8ac4806e210so25720217b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 02:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791971126; cv=none;
        d=google.com; s=arc-20260327;
        b=f74xyo+J/AZ3mNpoFjxoTHr26c07svy7SIsviTzTBkS1sApGHX0CLFIGbjji+EJS13
         iPxr3J5BtCRaW070vD5J2kZNpQn1d8AKs61hvDXgzwqjm3JyGO8PO5mP9/YjUB8AY51Z
         1v9I2g9F9d4QB2MPpUVXGFg5N4p0AjMZhDq5d/Q8x7aLVP6Gc905DE3HiTCHsP9Hq2/U
         uiKi+2ynEFZgc4mT9J0oEO3I2oY+m9lT/Kgk4IRiA7NKz9WHeGd8aGRu190poN6JEBbN
         /XFesb5EpyszHUmyvWE1H9op3557vP6/S9AB0g6e2tObpmL9g03Z04f7QwX9pEA7H5+J
         BBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        fh=6i80qNaxvQehVn7P0jgi747c8XF+GWfjyyYVmOrLuUA=;
        b=Dv0+SJ63OyIqwcSVom9TXklhiEYQqnk5mPeni5tXRopdxBL2WsmDsx4QEnqZ8/4/eG
         tjBJrhY9oGzaNk+3vAwUCKE9zV1KdwyjKW7Xmr1uce0s2LiN3AyBIr0ICbCPM481SDWC
         V4HRp0nwwXLxruVwHlWfcm140xwC5z8c4BwPewYwyki+6HPdA0VCRj7ROC7ZLAZPNuwY
         kllSrKNDdkjKV3VeXH9I9O5B8wU5gbfMk5vuzrPH2gh1opilALnnyCqX2V4688h5aUeS
         bS37ojBkotxffVgBBZtguUHC5QjQXGKseM0N8KFwvauknMvDznZkyqYuZHAxiuroAql7
         7HCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791971126; x=1792575926; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        b=fxRA/YorQp64MOPNQW0G3vFH5y5eIYAM7hXfKabLf2ygTQoq3CBt6ur9Ucxt8bEjSt
         LI1Z7vLegGVwX7AdiCHVncSTdQckuxAwaSninm3xXAjDMmD+jX4HOXIPtoznQW8vfUoG
         ugKK+inFyG66RTv/A9VhQ745nWZztovEeStQWMTn5xRn6brJVm419DmShCTfbSIp5YDe
         kt3SIfZCrAZ2E+XLtfULhxdf7dYnmpoJYUdZ7KUHUQKAkZQbVOj3SoztRt1pjwgaFa/D
         //aD4rihi5QMvI2O8h8Rb2YreibapmTKYnfzAsQRLerxQYa61kK0cAtimfN3Cm61BlEt
         38hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971126; x=1792575926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        b=gqcWy0BM8wXZeMRxUB3VAQXxzHIReWcoS99LaFXaz5InKjUUGmz5SZJx33uylfMpuL
         04i4uskhH8bsYYWZpESGm/wxgca0X8cDrmos2cdvg7nHIKc2OpIeBMk4XI27+Dy9vYgR
         voZcq39wBQW1Qq4TSqc7Z/C+lO1ZOcaeKvPDwuN5kIwNkxzGGvLTeoiV8uQqIKn1dDSO
         Vi/0RPbcyz2wbetPsgkDaKLNoT6IVsU+DyKshO3USi7I1BNq2zLiaX6LK6qOqDQR5T5+
         rtPH+jpIjNiOOwzGaEe46Eov6OrqgHpOfChxW4VLvTIFGv2A4UH8QRyyigC5qBl7edUQ
         jLyA==
X-Forwarded-Encrypted: i=1; AKwUvBzjzJKoO07R1ZkmpU5zQUYGZIV7snY3iwHxNubSa5XFKnNkZ30PmAS8uwfaZ7O/UPllS9PoomqQynmyp6yyyg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLBI75H6jqzC0OQze9lJm9g8+RpJa+aRsBolXTBVLzjrbJxCONk
	iLrc/DF3gzxDw3pACfkk54FdhUrBvzY5PXeWNblXvXwlrDjKtiXTZ3lBL9Re23jZ2xq4iUH83mu
	7xGGwxdmvbX/N3R3vHrIhTChOw4+Frh2hyoBQgtO9
X-Gm-Gg: AYBFou0IeG1L0uEyao6lfYUhbETdsdZk4LpAgATyXSpBb7D1Q7YATYXSZXMgDiuOAbp
	nVUpIy6yOz4aamwFMt07QW1wAc3wVtBS1nUxLw+qB//bbK1B9TgpVuYoN2fXE5lpIzghkafsPVL
	vber+CdfIYgl42wse8VBLalNKIQn/GxHBDCHsZCXa9KlpKjVjFw+/+CaescG3aklyBeeSL52KOw
	McPSP/86uzmcw4ZxETiFtvR2WzL+qFDLExKxy6q+e213wgennVmnkDAebQjFx8DjN203gwgFvzT
	pZPVPQAhP6g0Mf2EyPhOMm4pTKY8YLU9dbXw1Pt4bJMdwtpC5R0JXM6M7a7qpReufws801L++2E
	m52zQ3FcUdG8Ul7gx9MrEDHXDVslbZyP0EWA6LakuCp7Lmba1Qd+9oPukzjm7Q8pkaJrZM58ySG
	eT/vy5fZxLhCQ8OH9kby92R8PzdGBjH8a31eMubhUIzjFFOJJro6T44LqpLP12kF1pM9MoobA4b
	PCwKW6TLIZg7DSCS9zh2r8uSGw/F8DJmPFuyMMim6076o5IgtvSZK6/NOuwdLYwF9I8KBoeQ6ot
	tL41tkEYLgeIFQ==
X-Received: by 2002:a05:690c:c4e5:b0:8b0:9e22:2651 with SMTP id
 00721157ae682-8b09e22273cmr36219317b3.7.1791971126209; Wed, 14 Oct 2026
 02:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261004171636.3545085-1-julius@bairaktaris.de>
 <20261004171636.3545085-2-julius@bairaktaris.de> <b4aa46a5-dd8a-4520-8574-d008a3877f28@nvidia.com>
In-Reply-To: <b4aa46a5-dd8a-4520-8574-d008a3877f28@nvidia.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Wed, 14 Oct 2026 09:44:49 +0000
X-Gm-Features: AclHuK_at13xJpgBNhwlZvLzlUVxJXDvkN0LGkLWSuS73Rn7U8oFN9DIXlg-t_w
Message-ID: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
Subject: Re: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on
 flowtable offload
To: Jianbo Liu <jianbol@nvidia.com>
Cc: pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, lorenzo@kernel.org, nbd@nbd.name, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	rdunlap@infradead.org, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, saeedm@nvidia.com, leon@kernel.org, 
	tariqt@nvidia.com, mbloch@nvidia.com, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_104529_774236_29E03A4A 
X-CRM114-Status: GOOD (  16.22  )
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

On Wed, Oct 14, 2026 at 03:17:00AM +0200, Jianbo Liu wrote:
> The handler is only in tc_acts_fdb[] and only accepts flowtable flows,
> so NIC mode and tc flower rules are rejected as before. Looks good.
>
> The comment says what the code does, but the consequence is worth a line
> in the commit message. Because the action is ignored, the priority only
> reaches packets still on the software fast path, where
> nf_flow_offload_forward() sets skb->priority. Once the flow is offloaded
> to the FDB, mlx5 forwards it without touching skb->priority, so the
> offloaded packets do not carry it. Refusing the flow to honor the
> priority would keep it in software, so ignoring the action and keeping
> the offload is the better tradeoff, it is just not obvious from the code.
>
> I checked this on ConnectX-7: with the series the priority-carrying
> flows stay offloaded to the FDB like plain flows, and without patch 1/3
> they fallback to software.
>
> Nit: "prio" already means flow table priority in mlx5; skbedit_prio
> would be clearer. Not a blocker.
>
> Reviewed-by: Jianbo Liu <jianbol@nvidia.com>

Hi Jianbo,

Thanks a lot for the review and for testing this on ConnectX-7!

I will send v4 with your suggestions this weekend.

Best,
Julius

