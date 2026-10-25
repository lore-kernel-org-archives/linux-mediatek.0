Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F00606A31F
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Oct 2026 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p1rsD5IY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jYqlSEpV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KLQlagsRKAQ2szx0aaP3EES/xqizR2EBTnrR9DEFR+8=; b=p1rsD5IYG/03SF
	SgWl1hD//l/Zf6EACLoKyP0TtM31vZTQLXZSU3MvHGCPeIb6nFk2WdcOZfh+A7pArNHxZzXofk2ht
	icJGPXR6ZS47/nooP1ELxoo1oYJxaWqeCeHAFw9V7N8LAloBIEJB6+Un9ugAXrMGxElbwFx2jezKe
	Z7cSxWwoEWRlLu9LMTle/U6nGoQUMmSO1THQZFBboIWsPg7cAvwwsUO5f5fw+dNUJqHGqEKVO7IKz
	1Gm49YkA8amnPsPmhxxwtnhSVHXB5lpT4Ksu5+OWRlzr2DZz6s2AKiPkCQLNW+s+Lrvk9/YD4VoQL
	LO04/zw7iyvuHs78qRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKwgb-000000010xe-2iZe;
	Sun, 25 Oct 2026 11:46:49 +0000
Received: from mail-dy2-x09.google.com ([2607:f8b0:4864:36::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKwgY-000000010wI-2Zrs
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Oct 2026 11:46:48 +0000
Received: by mail-dy2-x09.google.com with SMTP id 5a478bee46e88-35cd538de29so1132666eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Oct 2026 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792928806; x=1793533606; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KLQlagsRKAQ2szx0aaP3EES/xqizR2EBTnrR9DEFR+8=;
        b=jYqlSEpVKwxqXkwwuREiAiiipo57vfCewBd0UXI39iGElIAMEBN1mNAUrPyy7vN1vR
         RaW2Q6Ygeree5Nlogfp9v56v+d9kPN3T+NP/R0gFaIPrjEmvG/RFiPxTJBGOqBkRBU8O
         V3fiDh5f4syyha8Mbub+ZpS6aPY2fj/VUvC3QSlWTfWIJuaMdIsthMNQGgJvBW6qRaX+
         N11vDtfKgG+ia5zM55rE+D52XaxfiwqBEz27OeuYRZwPf4T3yQ/zrRU0kpXa/XVtzPqJ
         Ow479f1dx++AkArFVQ6LfSEyRwutCFMd1b0A4hMxDl2ubiQNUnv5nrr7JXKOE4YmcZQq
         CfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928806; x=1793533606;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLQlagsRKAQ2szx0aaP3EES/xqizR2EBTnrR9DEFR+8=;
        b=jXi5yopzKoyOyiFW470RM3mMt442sUj/qV6cpBvu0c5l1i3+eUM9g5zGpGyAfmN6U5
         xmd4e0vHXTffEEoyjSesTDQIQtJ24aw3KIZnLZWbx+pqCDvTfaIgj/2mTUOhchRZN6Ew
         KOgh8twDjXmQDLlB6IFlgNXpXWNvNpdZayr7S604/obQeAFXuVD/RPRz1pvuUJx0s5hF
         PYmRVIOCx4HleqKVkOk1AMvq6ZfulHlHDBtTSXH15ZcZfGi/OwGpYu5Sfe1ldCVNorP1
         /IhPfK3OuhXBdl2j3Df7tNH0Lqr367eBBMY0XfzCGR1tP9SNYraxMqqlnzOAhf4xqi30
         J+VA==
X-Forwarded-Encrypted: i=1; AKwUvBwle0pqH+yBHyaCO6mJTEqGPAe7BNdEo6ec7uG3vwMfi/Wo9IS+8arySmtB9Li2L8f1pXVsZKH7MiR9OFLjPQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYK/6Fz+a7Tlqx8aAvoSf94RWnd8Ayxh9dTENEv8JvqLgoiCJCqs
	OIuROY3Gd+K6MwoQ/qMGFn+fU8DCZci6u4fsq52RewqgUDUiPaaikTwCcW1ZzvPW2a0=
X-Gm-Gg: AYBFou3v/NUOGHYD4SjHTNdRWgFKrKy3ZTHL/SLm7F97ld60VzQ5rDEF4O5xqtLiw9s
	yq6tJbD/kKOGGgxuE86FyMQiGKA7mJZEIJiSoOAzeQqtoj/FgUaJdfFMGR/5euD+NvOcebZm6D6
	GkYDK4yAUx4nG/xg2MiKqxXcNe+WRb/wRr98riqXt2ZWK/NSnKcEv2OzVDkrY0ARy4BDnCCPEqm
	o8YPrbFPk2eevieeSYDAbX4fTxm4LUFfC4CoEvViG1Xtjp77jpncS0119yRFlIT5w8Xh8vje6Uz
	dmTf+vGktrmrkZdVoIFG9F0Ehtiw7DTfHaTck2E7ztHRg59HqOruLS++5Wg48XPAwdEcFf5CEJw
	NQ36KIiQX04E8r88JYfta4Ph5NPEXYPXW04A5jvcqwLCXj1Xh7em+xYc3ZTjLjXGNNfXhyLdhUc
	pnyKcJ9sMv/rNnJsmTLIlvqnUbJU4HGTehQ0dIVEoH8fL6McnXVmzsS4a2CTcstfE4bM1IgH2oT
	IyBY1yNK+rnlpckp8ZCRjX4meDpKo/z2R7K9wcrrasfWaS9ZMhs5sFr99aKfyr7mqM=
X-Received: by 2002:a05:701b:4306:20b0:184:1898:add2 with SMTP id a92af1059eb24-19935625958mr5098384c88.26.1792928805488;
        Sun, 25 Oct 2026 04:46:45 -0700 (PDT)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaebfsm15542281c88.15.2026.10.25.04.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 04:46:45 -0700 (PDT)
Date: Sun, 25 Oct 2026 19:46:40 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Roger Lu <roger.lu@mediatek.com>
Subject: =?US-ASCII?Q?Re=3A_soc=3A_mediatek=3A_SVS=3A_fix_device_re?=
 =?US-ASCII?Q?ference_leak_in_svs=5Fadd=5Fdevice=5Flink=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <230b2dd8-8d8f-4b1c-ac9f-2c1eac636751@web.de>
References: <20261023082948.1854252-1-coiaprant@gmail.com> <fa60e7c4-d8ca-4ff4-a56f-6a6e2bfbf3cf@web.de> <9AE974CC-F342-42F0-84A3-D72C3A0326C2@gmail.com> <230b2dd8-8d8f-4b1c-ac9f-2c1eac636751@web.de>
Message-ID: <2E8D967C-6CC3-44C9-B447-9D977E7A6538@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_044646_655092_BE93F3BF 
X-CRM114-Status: GOOD (  10.97  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On October 25, 2026 7:42:51 PM GMT+08:00, Markus Elfring <Markus=2EElfring@=
web=2Ede> wrote:
>=E2=80=A6
>> __free(), DEFINE_FREE() and return_ptr() only appeared in v6=2E5, while
>> this driver dates back to v5=2E19 and the fix is tagged for stable (fir=
st
>> LTS is v6=2E1)=2E Converting to scope-based cleanup here would not comp=
ile
>> on 6=2E1=2Ey and would force the stable team to rewrite the backport=2E
>>=20
>> So I'd prefer to keep the explicit put_device() in this patch and leave
>> the __free(put_device) conversion to whoever owns the driver, as a
>> separate cleanup when the stable backport is no longer a concern=2E
>
>Would you eventually like to become more involved with corresponding
>source code transformations?
>
>Regards,
>Markus

Hi Markus,

Thanks, that's kind of you=2E I'll keep it in mind, but I can't promise
consistent bandwidth =E2=80=94 my kernel time comes in bursts=2E

PCS is where most of my remaining TODO list is, so that's where I'll
spend the next chunk of time=2E If I get through that and still have room,
I'll take a look at the other device_link_add() call sites that have the
same missing-put_device pattern=2E There seem to be a few=2E

Regards,
Coia

