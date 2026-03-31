Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A0AFF60EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2026 09:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4IZZidSD2WIAS3m5FuPO+zmZWOkjgPwvsnfgKOy5uk=; b=2E9TqB1wT9YsaQSIjjxn6NjC4F
	Z+oBmTGldbMDm98vVdaiESy4H/vCWjs7tVoLS5O03wBk8ITw1w41NFcCFtGnfp1ZDxpTKgs7KN3lO
	vxwVfkCF3rWg20zikW3x6oK9YzCWhwHlYd32WeRR94cqzl9dv8kYpNm8RJOcp60MWly7ysau0pFIJ
	aoJEMQxd+Ngv4PFwE5sGg4CCxp38l83xLYbnTpZXSHq0YGDPKrO8hsKma++JncIwJmFz/J4UD1w8Y
	ev/QJNJErkjb5a5gpWr7Z+jNgF4FYrAUNSwv/6cwc7xSgubfutcdy9gD59MdoTqcLEkwRhmIcOdKA
	ee1kG4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VRD-0000000ChAI-0zTN;
	Tue, 31 Mar 2026 09:31:07 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VRA-0000000Ch9c-08FS
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Mar 2026 09:31:06 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-65003f40a22so6716954d50.2
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Mar 2026 02:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774949462; cv=none;
        d=google.com; s=arc-20240605;
        b=QcrTX4uelo0OULpG98Jrayq7q5+fycJi6xz3/+HpsMeldKAHnyYss2VZ9ptCwX2rBg
         XPuYJfoDmn9eJovE4PruKPZlSNRnzGcf2pN/noux2SLlttrSMWpAAXSnvdNQ1nKo6gDZ
         NwQF543XuHhDW5LxjLvT/Vu36FSKFu1wLOAm//1oc6XizwnVERX2ZpbV88EUWhBUNs79
         VbA6BuT8KTT6ILhpuvfDm+cWz9dQf4C63Rhin6A2om0Wk7NbNcyVtuMu6cuGgYMqDq+z
         W+qbhBFFahqEOwE80di9W9IU+d0m5jNlIITZ3fN/a44LAnQeEMZ+zgs0/t6T9gMT3uES
         NIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N4IZZidSD2WIAS3m5FuPO+zmZWOkjgPwvsnfgKOy5uk=;
        fh=6SpXxLfe+PTiPSaoSaPz/qBBQBbPuTtlBJMzIjRwgos=;
        b=V4V+f8y3pDbky7X845GbdSIrF8QAb3Ri1JCiqVXkqUy+KyoFy7v1SrQfvhgk6fApot
         9GiTkeo23Zi7oOLN/U9q6T8ha7w5mBIfkFKwkR/dTiTAh3wmw7KJ7rhZUxjf4Y72/1go
         RcSBsyQNGYf2FoCtC/vYwTSm/wBAl1OUsl+5wNvpKSGeuwlaQnX8+twSiHat+C3uK3dq
         ySYNkLlQd98lPJd8cGE06i95UC5OftAMdrCwIhVYlCryOJOdg90eWj9PW7UL25E9c4Ey
         D2OcJkcw67q7yLUmp+0w3KjHs398+Wsfjqp3wQbiU5LQp613DAf8FFrgTG4MHV+to2Bj
         E5YQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774949462; x=1775554262; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4IZZidSD2WIAS3m5FuPO+zmZWOkjgPwvsnfgKOy5uk=;
        b=M4z+bHKcyGye173NvWAbUzpGvGSarg1xqxPJ+582hSZqblnRbt8aHvHat0MWA1SM2T
         LmkeQcLUtWHUJtjGbqHZYn+sunHhScmq46oCHg2BDAI/X8F4cvS76gjUBbPdcJC/+5r7
         GQlYyeTpoBhygaJzYQ7IZTC15xsZcerUdcIMoBh/Xr7OWqBR3lcidpXaw9rQvtx2lfAH
         6Vzf+XMeagXxh8xo8wFgfqkXNupKhMX85RtTjVa2gvdPo1TO++iZKtkdzcQIk+wx2ZGF
         MrFBo3VdzlCRIImcBk2aInlMQ/A2TSWSusyIYN29gXPvGyVCPPAPLmugcj+BeiP+pcIr
         k0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949462; x=1775554262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N4IZZidSD2WIAS3m5FuPO+zmZWOkjgPwvsnfgKOy5uk=;
        b=UP1R++igXZ9yKxe8YYn3NYQ35GmURirnCL1UGimuTx2kxcWmv3RgxYEMtZYN8gGQHS
         jaijlgpp+kjceS9zliiMvNc9LSJE5XYWilqKLK4m0M82cZudS7K8cXTjWWTqQ5kXFNn7
         b6TrZ+/maqNhAwx7INWTNPdznY4Qmh/mW4bfFljgTJMogP8ioy9dh5IqmSfqPt25qg8N
         tMCaSNW3IISJjG9c5ocK0a7ct4O95CviL+jKtAOpDpNOFvslcAy4fbUr/SfC5VELZs8u
         ebFDFXHRFoakm7OPDqzxdUKvCW+gggSdvtoKz6L5k7dEtO44/CkIA/HuyMcmflD/9/RS
         J7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLZv09jQboJqc8nbxYm2TtOAnUb6mBiWXK7ghHzz+nRsNoPyRnEsYOlFsgmeVlLgNvQSDXOgqO2pvgLglOvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGCVorG7G/EDh9vnfHQlkX0kIOo6SG/7P9RuhYJPdfzizqf2R9
	C1Iakx+OVRK0gVGT7crnl2jENUyOEKUPhyJSQ0h1UWg9ZPzD5RSQVHrH5RFy2LrHILdwc/MpNv1
	F+U55Ty0zr3TWJH5AfPE1aUU32Bo+a6E=
X-Gm-Gg: ATEYQzwjJ1PUVW/ntuKOyQL2oFnAsFumVtn+sq7W8hmtAIsz2TRKrpkc0Jx7hKYEWdm
	j5BoonY6KNTRg3xkf4b4owpRyzl2MTMlEX5xa2ohgSg/NS/k8mCho28LjpcZfg1t1f87vnrxh9z
	22PKlJj38KGk6AR8YQAfHLbtW85NOHwJxfLFxt9HZc6ZyjYhfQyFrJdk2zVWLT+PqYUOeiUKSNP
	XR4PZws1xyqso28OrXHkLJ4KIhs/zyxcJ/iEBmjM4sw9xeKSHlQ5p3fxDh6ofkUGvehAMkrTzTA
	59iKdA==
X-Received: by 2002:a53:acd7:0:10b0:64c:a0c6:da8e with SMTP id
 956f58d0204a3-64ff720f358mr12073996d50.29.1774949462281; Tue, 31 Mar 2026
 02:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260327021534.448552-1-lucid_duck@justthetip.ca> <3f4103d9-4871-4ae8-93a7-d286fce37443@freifunk-aachen.de>
In-Reply-To: <3f4103d9-4871-4ae8-93a7-d286fce37443@freifunk-aachen.de>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 31 Mar 2026 11:30:51 +0200
X-Gm-Features: AQROBzCjgtPgpLreH4PDh3vAfKNOaMMXa_BnpfjYnpFtP-Mj3gf6hF190Ym92R0
Message-ID: <CAOiHx=nm+9Kna6VDyug8Lxg7NQHJYoWnZO1Mo=pvbRRAscsPtA@mail.gmail.com>
Subject: Re: [PATCH 1/3] wifi: mt76: connac: use a helper to cache txpower_cur
To: Felix Baumann <felix.baumann@freifunk-aachen.de>
Cc: lucid_duck@justthetip.ca, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com, 
	morrownr@gmail.com, nbd@nbd.name, satadru@gmail.com, sean.wang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_023104_105934_39FDB9DB 
X-CRM114-Status: GOOD (  10.52  )
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

Hi Felix,

On Tue, Mar 31, 2026 at 10:24=E2=80=AFAM Felix Baumann
<felix.baumann@freifunk-aachen.de> wrote:
>
> Hi Lucid Duck,
>
> thanks a lot for your contribution. Very much appreciated :)
> The kernel has a strict policy for contributions: real names only.
> https://www.kernel.org/doc/html/v4.11/process/submitting-patches.html#sig=
n-your-work-the-developer-s-certificate-of-origin
>
> May I kindly ask whether it would be okay for Sean to use your real name?
> https://github.com/Lucid-Duck

You should update your link, the real name policy was relaxed a while ago:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#deve=
loper-s-certificate-of-origin-1-1

"(...) then you just add a line saying: (...) using a known identity
(sorry, no anonymous contributions.)."

See https://github.com/torvalds/linux/commit/d4563201f33a022fc0353033d9dfeb=
1606a88330
for details.

Having said that, I don't think the real name policy would have even
applied to Tested-by / Reported-by tags. For these it really doesn't
matter, as these are not code contributions.

Best regards,
Jonas

