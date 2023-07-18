Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B54C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkR8qqb+tZbWWWMSMobDqmb6wWe0/8Tvk+eaJzSaNiY=; b=RnnA2+g4yiYNBGCmW6Ap8tZLMZ
	2Q3l+HMsNxCS9KPOeb1A9vm/aY7ShHkU7QTr+CSqug06F6OwSXHdx+g78cPBvACJI2Cx1yZVYTRHu
	OYVPiVB+FLn5oIFZijY8jt7KzxjFcknx79DxetWflPfnzp6f0vb3v+KlDaeyB0XsB9u1VmNqjikfu
	/y8t8KL907sMPwDCsjTENG0XFWEWNB/FzCdOYldUigYQmwQUn2VSY8UXrlLOqy8qWIrgRzRIMxL9h
	7aBD0Jfz7jjDqhOY9C5GcMEB9rYs9erDyXHlv1qNx7rRwKP4OT+ZBaGuGrXmCb3Or9V25M5dbuRKY
	mic4oRIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0kt-005mZU-1k;
	Wed, 19 Jul 2023 06:33:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0kl-005mT5-0L
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gkR8qqb+tZbWWWMSMobDqmb6wWe0/8Tvk+eaJzSaNiY=; b=kJ9FpqyhK4bGH+DyDfwV9CwMq1
	sXdBjMGzEn4mRzG6FEkc74lEehQHca0hbdfiTdOpsO+8jjdAN8dqhbBr6nINs0ib8L9KGanNt+5QH
	2nR7dArXCpLNjnDoVSt5sds8BjbKLRdAyy+TvNqJNeLaIKcz/nxMKREtRAdpTZUWzn/7BJBdOAO7Q
	3+1UwqEes/Lu6uxnf3TakYBNAvP3TrBAQPiZDb60SuObXeEoKmpezIkI4U7KqmX/0Uzl2PaTNaabD
	IJoN3C1Ke5W0xCk/hz4ICjP+rswoQBB8LlLeCVnBxEthX56zpcCESYtqFPGQVkzFCYE8WXAHceDIQ
	EAZHfUKQ==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLegO-00BF1x-1Y
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 06:59:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31434226a2eso5328556f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Jul 2023 23:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663514; x=1692255514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkR8qqb+tZbWWWMSMobDqmb6wWe0/8Tvk+eaJzSaNiY=;
        b=oQzkecp3eDrjKFOrzKgXnZOg5cpVEKRypTPCPmhh/sLLfK0W13xCZzcM/VI70jJFPl
         Fwa3S8NdvFQKkGQYWJAMR1zHFP5Ysl/ufyEJWlJfgVXFX+JVtc8QPkUM7g/l2DRLV0Xd
         rXUYg0ZzVPn/Its3B26G9Rh31SHyyUykKmfeL19t3QK1qBu011h7v3SY91KLqbfBHfPn
         0Vqo0UVhfKmcNde+/yF0AkJzsJTSB75UxChR9fXOS5ItLfBPwN0Ko79me9Esy27HwssM
         Dyobl8S5JWavMrJgqDtPD9FWeR5bs99rsyeUMNa7SakXrucf4MB9NCgQ6ubHIvXoLpjy
         NWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663514; x=1692255514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkR8qqb+tZbWWWMSMobDqmb6wWe0/8Tvk+eaJzSaNiY=;
        b=mGg8uc8sioR90quRgRM5AK7f6x8XsLBqXYKLEEGSoHDkJwFEzWfW8COVWDkxirL4Ng
         uNMkEJzlF2UlR3qvLVLqPM2vd6UpaHutQgPyvRc9UzdYHnGoqhtK0N4snIhkBSOnIWiv
         jKXKhTN5dvpj+xdjZmWp3quLmL2bwScK6MFfTbwZzX4GpbiFDqmTmBN80iroPdIYc7Gi
         ZLFA4sG2SZKiGKWRnAn/8clQDroiqiQsSL5DQ14kA2NRe1fK2YyOWz3PwKvJakc4onih
         1P05t+hVhDUTr+GpDKiqW/SIwzy965kzeu3fKd9PP5z1b2BDgUSf2v5MfkoQ1njHudQV
         mdIQ==
X-Gm-Message-State: ABy/qLaFHf5E13wQ5YIpQq06w274ziufUK7YpVKgfQj12t+4eMdj88i9
	DNN8nKrvnO5WTPsHxymVeMTf+A==
X-Google-Smtp-Source: APBJJlED6jt8xHaJu7Q+cJhP4iZsf33uSnbrn3oqSpD8pTr55ZYfnUl37FR46MpOM2b5hdLAdZh5/Q==
X-Received: by 2002:a5d:4b07:0:b0:315:930a:a962 with SMTP id v7-20020a5d4b07000000b00315930aa962mr14378852wrq.59.1689663514061;
        Mon, 17 Jul 2023 23:58:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r15-20020adff10f000000b0031437299fafsm1449736wro.34.2023.07.17.23.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 23:58:31 -0700 (PDT)
Date: Tue, 18 Jul 2023 09:58:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: mediatek: vcodec: Fix an error handling path in
 vdec_msg_queue_init()
Message-ID: <1dcd0fab-eee3-4693-a7d2-4a72baef5c97@kadam.mountain>
References: <efa0d4910998931a2ec9d933117fa71482d7b33a.1689624542.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa0d4910998931a2ec9d933117fa71482d7b33a.1689624542.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_075940_637810_B90978D5 
X-CRM114-Status: UNSURE (   9.68  )
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

On Mon, Jul 17, 2023 at 10:09:19PM +0200, Christophe JAILLET wrote:
> All errors go to the error handling path, except this one. Be consistent
> and also branch to it.
> 
> Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

I sent this one a month ago but it hasn't been applied.

https://lore.kernel.org/all/b8948d9a-65bc-4f3f-aa90-60addd064819@moroto.mountain/

regards,
dan carpenter


