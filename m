Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE895C47089
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 23:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B64nahlnQTvizzFWN/MKOqXMuPOFiJayfJ71EF7WbGA=; b=tBvquO94Gg2UEfpJSXKqw8OjB/
	Ek7OOaOt+UsLQpprkatxJsT1/iN3b2aY9xYVrDIq/zYupTChlz6wN0UO6ZIT4HxaMM+hLXrD+tfZp
	elAfrbkwd3E8lj5HS+q75sfxbX1GMRq6L9P4MCy/CKcDkf9Wdy3A/6Ql5JN1jxKMeg3FAyor8UCyD
	+X8x+oCQtz9mIkH1wf7Ba8mMaiU0CPH4DI6skE7acHoLVcsvOlDxh5Uq34tY0ENDgSgCUUQJMf7p+
	MR43Ui3a6Rhi27DNjuJGe/Ikw6QzhIUMj3xONubqO/DV0dLpu3TibreW/IF4o+881TSC8Iy3xwbNj
	TtLEvXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2KvW-00CU87-C4; Mon, 05 Dec 2022 23:31:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2KvR-00CTqo-3n
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 23:31:09 +0000
Received: by mail-pj1-x102d.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so5140086pjj.4
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 15:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B64nahlnQTvizzFWN/MKOqXMuPOFiJayfJ71EF7WbGA=;
        b=OdoCO3aIPMdfROqUjmXL7OEIA9CYBS2QJpBEQA/J/lXle82NRW52w+zlIhfg8ms1LH
         /TaN9ef8SYhihXbLecW289xcKfk+r8jWkj++QJwpEkQ1fXVsZ/FXGTthxTDx3eTv2LqU
         aF9+9jCAsL/TJziFYfMd+KTj2pD0QOxM5LCYt8tjyk5XsS1+uOrVx9Njw5OmkcBBVEYX
         KSGIvwzQcHLKi0zMkznu7zvWfx7VwIEZnBvI3Jh70JzLhhauK0TvqwYPjpm562G4twQ5
         bH2/dgjDSmgv5Ucv41xkKot6rQ9Ok5rWk8g0NNt3g0bAOZFq60lEilO/MyCxX0rMGr7l
         LCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B64nahlnQTvizzFWN/MKOqXMuPOFiJayfJ71EF7WbGA=;
        b=h0kIQmzVwDxq1LDFeQIhnUVoL8oUz1TvD3eO80FcSBQ6RRd6bUDdCgK1VuqbNYY7Z7
         f5gfnFDrgcL4SW1aH893Hv3JPsENpnGWpG2wpIj99y0D5N/e2OW8ZODCDLi64F3VP+es
         /nXwBLTbJn6HWPXnSJdMEPtAhDHcpPN5C3LkxCFmMuiFccJq+lkb7RhQijZqyem3IDTI
         Zue1JyVcRoKzul7Bs+EEZCWIoJgeITBcxJJfoZEqFlSZfyzikq+cds7SAdjtt8ZzjjoH
         KoSbtVE3VhAbjEWGS0kOOvyRNzhYpOlZzecY59XxHAe6Dl2+8N0ChVrJqBEvLA7LBJd+
         W0KA==
X-Gm-Message-State: ANoB5pmjb90YWJYR7W6TDGIgtgpu72CaqpURLrISmpRsWrNGu04OPfqj
	Bv4v0QPMAwHStGzNhRJ9Q0sxiQ==
X-Google-Smtp-Source: AA0mqf5QjTlWvI5ubzCjEUZ2XSBplUYzhwiX2VZlK2wbZvvlG5QcSd1Z2Q5+Y5Ulo+DwDdjITx4zAA==
X-Received: by 2002:a17:902:b685:b0:186:5e2f:44b4 with SMTP id c5-20020a170902b68500b001865e2f44b4mr59374pls.29.1670283064040;
        Mon, 05 Dec 2022 15:31:04 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b00189b2b8dbedsm9188203plh.228.2022.12.05.15.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 15:31:03 -0800 (PST)
Date: Tue, 6 Dec 2022 05:00:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	regressions@leemhuis.info, daniel@makrotopia.org,
	thomas.huehn@hs-nordhausen.de, "v5 . 19+" <stable@vger.kernel.org>,
	Nick <vincent@systemli.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Revert "cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()"
Message-ID: <20221205233059.izdqcilbhjmkh6ew@vireshk-i7>
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
 <18947e09733a17935af9a123ccf9b6e92faeaf9b.1669958641.git.viresh.kumar@linaro.org>
 <CAJZ5v0ixHocQbu6-zs3dMDsiw8vdPyv=8Re7N4kUckeGkLhUzg@mail.gmail.com>
 <CAJZ5v0hc8CsvqLKxi5iRq7iR0bkt25dRnLBd23mx-zdi2Sjgsw@mail.gmail.com>
 <20221205043044.bgecubnw7d3xlyi5@vireshk-i7>
 <CAJZ5v0gTV5LM_qRKncPq5Z2TRENMgVer6oZiGAKJn6ndrNSKxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gTV5LM_qRKncPq5Z2TRENMgVer6oZiGAKJn6ndrNSKxg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_153105_418438_D7DEBEAB 
X-CRM114-Status: UNSURE (   8.54  )
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

On 05-12-22, 13:08, Rafael J. Wysocki wrote:
> Well, this was a bit unclear.

Hmm, yeah. I assumed that the arm stuff will go via my tree and you
will be in sync with this. But yeah, a comment in the patch won't have
hurt.

> Alright then, I'll assume that the proper fix will come in through
> your pull request for 6.2 (but please send that one before the merge
> window opens), thanks!

I was ready with pull request since several days, was just waiting for
this to get sorted out. And I think this may get delayed a bit too, so
I better send the first pull request now and worry about this later.

-- 
viresh

