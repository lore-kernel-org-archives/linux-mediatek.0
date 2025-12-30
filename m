Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5382E9413E
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Dec 2025 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tRxRWQzRmCYnQKX7qKIJ6OMcfRXAAVN0sUWsz8Z3ZE=; b=v5NAi6q3IvLnB/iHX26prk7WS8
	BKBfq5eaUZbKHW6mnfOJBsbjLUHA3NScqCQGgabMTNYuBAjpvL/oK1G5drhrOloedP7BBZDB1I+a3
	Azgga0I7HGbJECh0huVz5pnUR/IPYe07wM8MKZ7WUeUdi+Jctw2DI0udKLW5tKiIF2kp2STBoRVZG
	tm9AUi06voWdZEuhQjD4bIy/vYz8jaILmObk2Aakwvj66pDt/yMNRm9Vs5mLNFPMohOg9qEeClTOm
	LfvhptDuHWJEioU9+Nlss9kZcwE/EJmMwEZG4MIodpDjLLIJX66dQaTd//FbQOduNU/T9xq82ECYT
	Y1qhEuPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWWc-00000004gra-3qDs;
	Tue, 30 Dec 2025 10:00:22 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWWa-00000004gqk-0YfC
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Dec 2025 10:00:22 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-594285c6509so10674665e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 02:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767088818; x=1767693618; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tRxRWQzRmCYnQKX7qKIJ6OMcfRXAAVN0sUWsz8Z3ZE=;
        b=NZCjt4gG1yWby/KKKx5ZYvKh9eNDLQyx3WSO5eKtvKlgKIAzk2bpOwC6pf+0RrMaSp
         lViCGU57bKQ7IEV2Sx/LIzUxJpe3xtaA229jng4by8QeS4qNCKeGx/5vcWKytuRf60c8
         yOl/qohbmwoqb300N00r6+E7sEzIAKLDWEwGJt4vSak+znj/QdLb+60+MRm/q4sTneYT
         0ifck51WWhDX0f2yol47L3B1UGif7KqC+Engnq++ISow26kSz16MTsDK1X5sq+VhOPej
         H7FJCRm4V/C7kKgIO1S+fv6x1Ddn4WnZB0Vcf52OmgLL6IRRaRjEOfGDwh9jdQ5xIX6R
         0YhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767088818; x=1767693618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1tRxRWQzRmCYnQKX7qKIJ6OMcfRXAAVN0sUWsz8Z3ZE=;
        b=BU3F3E1qhAcnlCTaHuxOniqoMOP7wi2kThWWDYFBYl6hBXZpHqYZ0i/YHaOLSolS0b
         kAOQQgs46TwNokeodobNxmtGgQkpb5B1pRz8704y0iqNQOjiYPgN9j5aFlJNsJGHFk0p
         i0oThjz4BSvZz/T1ISggUs0KFQIIB6kquWET4MfJ8NkCNIb1GKwyRn6qNBrEGXfBni/X
         Z4b/TwbQJJVkG7Gck9XwuDEWw6rZFv2hksCwZsA2jdDISVnWjngXHZfuzX+vey9k5sfN
         fMMcm4KH9p3fiSsBybwrrdolrvLY+hWbdub3b2aaECTUwUw4YS4L2sJyT9CbdrNwknTH
         S8rw==
X-Forwarded-Encrypted: i=1; AJvYcCUZTAc5uOrokmJEu3xyAUo6OvpyQAtW+PY5jf5HiRigjAniqhZThe8UHEXnNQfiwsLGBsxKG38IY2GEngy6Og==@lists.infradead.org
X-Gm-Message-State: AOJu0YxD8Zc21KTs4Mz7iAEg2MEEVlMow/ME9rr3wDA7FxglqNNOkyJx
	4bU0vyIVHZUGrpn71V1P1vS4dlLrG3Umr6BOpbGyTdT31BBnuyIuMjexwH2Z73OErGkfLj3nN/K
	/L2UbIN1D/ou1eP1Xg0B/K0NcANBoiEhetfWT+TlNEg==
X-Gm-Gg: AY/fxX49jsyECHiWentuw4mL7YPy8Cv6tsYECSggUNMY1y+Ff9Q78eu2ZejcBwf/0L7
	jhjPR6791n1ftzqwhJZMkzFoUVfKNe20tYvw/TpdSt36nHtivuZyd1xyfk7OcfunESWTArck1dv
	pWv5q1QE9eYqLMed8lJXfpogWYnyyGayZ6QJqrn7OS3ehaH3fTIYbPd3z5YaqDNx6UkOCDnTUkN
	m4YrWj75gQpRe9V1Ycj49b0z4hvBpI2cNIYs3wh7IsRcpddz99pa2OScETD0iD8ePRoU3GXNSCP
	2RQh8UmfbGL1E80rtznD2d18FFhs
X-Google-Smtp-Source: AGHT+IHBp58C8eJD8jHt03+ooDUgedGd0HZ0sHq7BopU+wSyE8cBf88UU/sRfBN6CkzcQxn+JuN8ykjj+lfX1LiB4HA=
X-Received: by 2002:a05:6512:b94:b0:583:903e:b5a4 with SMTP id
 2adb3069b0e04-59a17d61e3emr11072799e87.46.1767088818024; Tue, 30 Dec 2025
 02:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20251114104325.116471-1-marco.crivellari@suse.com>
 <CAAofZF51pkOzrg_nO0Mhx6g9b3JPtO3n+0YE=WtSgj_F6wnY4w@mail.gmail.com> <CAGp9Lzoj2jeGF+t-UP0gAykCZ96-OkjummeJRGniYfagvY-BPA@mail.gmail.com>
In-Reply-To: <CAGp9Lzoj2jeGF+t-UP0gAykCZ96-OkjummeJRGniYfagvY-BPA@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 30 Dec 2025 11:00:07 +0100
X-Gm-Features: AQt7F2orGzKXzw6tzrN805-5mgW6Z8EpIc6FGRlg6vkCnPmNQoxfEOSCoRxEkUQ
Message-ID: <CAAofZF7KguhtNs_cXQdWgz8XdaChMG8G_LtEmhKfgC5_yq3iRA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: replace use of system_wq with system_percpu_wq
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_020020_180018_C023C6CF 
X-CRM114-Status: UNSURE (   7.15  )
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

On Tue, Dec 30, 2025 at 12:42=E2=80=AFAM Sean Wang <sean.wang@kernel.org> w=
rote:
> Hi Marco,
>
> The patch has been queued in the mt76 tree. Thanks for your work on this.
> https://github.com/nbd168/wireless/commit/ee518f914cd901c16fa08a6f228b266=
551f72a6a
>
>             Sean

Many thanks Sean!

--=20

Marco Crivellari

L3 Support Engineer

