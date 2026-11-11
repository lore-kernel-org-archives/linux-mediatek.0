Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854C1606A333
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 02:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fnjffEFa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbcaKLWh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0Jnm/5z8Q1yoIKS0OWVHvnc1/e7g1Ta22xUQi/ka3a4=; b=fnjffEFaeBAV5G
	EWY0bxSF9TtbJ/L8oYhpPk1l16dHC6XI08/v/3cVM4dJPDDWBI6kJMjffj9F2mwgIdMcYNleZHACP
	YGx8JoC2zt5/utFRgacURdmtRJebwp3ey36bW9zhC6YZTjoc19ZOBjrxFPsolMi0nC0rMjOAtfguf
	/Z0Zch/Ti1SteBeejSS2dfQsQm7iglKVOLrHb4WgLw1o25ffoPPc1ZsiSJkpCRZ8x281sB1KpLlQX
	7u9SfTys2cghSYwMYlhYYq8T4CJk2uS1MibRAXwRxGcV7EFGUkPHqUidLsLkPT2OWGUjXR+bbscfG
	jXQq1rzJzK5lIgV6S44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyMz-00000005Txs-0h8A;
	Wed, 11 Nov 2026 02:47:29 +0000
Received: from mail-oo2-x09.google.com ([2607:f8b0:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyMw-00000005Twv-19tK
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 02:47:28 +0000
Received: by mail-oo2-x09.google.com with SMTP id 46e09a7af769-85f2bfd7a07so1061898a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 18:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365245; x=1794970045; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Jnm/5z8Q1yoIKS0OWVHvnc1/e7g1Ta22xUQi/ka3a4=;
        b=QbcaKLWh7EHeu+Eq7BnVCekzetWZkLqsVxpr343NW12m6rnXe7fprLGLS/jQ3RnRQd
         JGxGxh+cmNTKc+o3sGMxHh7f81uujLhQH/0F2SKvzIaNe8RTzzgrq6v5oFonu4xjf+ee
         unHzYCGX4kDokCH8KHl77nisMRKj4XGDM2wRyqDXyor6PPE3pHIc5Q9QDSxHYdBqbIk6
         92Aqcw7PxWVTY4B/UkgLtXiRPv/yrMsQ2k3zr31nl3+VBRTW+1m4PU9OMfK52iQiH2Xf
         CcPw7YZVAoWGulpuYIoK+ixqunGGMvB+RXK6sMRoo68BYz6vO8Ty1tTEjNSsKNO5Eg5K
         JULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365245; x=1794970045;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Jnm/5z8Q1yoIKS0OWVHvnc1/e7g1Ta22xUQi/ka3a4=;
        b=TjxM/KF4D3FBWifPcCzF26g9BWwnppD+ck4WaZM+duV71yDz/H4hMGY6EX/qhV4Mst
         skgEWyORB7ZXlxFlQ2ITExzkQaLOUrzxUp3VJIbIcNqJL9WNiG4J6rLKXfMYjvgh1Cuj
         wzF3xdavqqZzpUzRY2ee1KAA/JEczbJeS8zToxjQy1yK/N4fa7EdFKwKhEO5oS9xX+or
         M7sdTVv3p6xV/qcOiALotOFyzSCFDtqvQjg85p0qHcP6ZVqSLt14qLMyUbrtnal9zFsw
         ypia7c3ftIsxi0Vczjf9GJbEMsg1qrvOT2upDQt48t7O6CEVdts2VU0fRA/qpyDJ6ENT
         HtaA==
X-Forwarded-Encrypted: i=1; AL+hErHwMLbaqnBsCM9VavjEgHSti+TmM7QI7qXJVcI1+6+IAAKRzff5ClOvf9J+HoyAfJZVX23je/ghnNnD/uTX2Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/CmSqdY9ylVlWNlUk1RCQPPqplpfBTfMVLJBKbNKicMfrohPpq
	et4hG7hoYWCbD8wK8K0gIGlAFDfNEfBxFt4VfqtYSoTb+CivU+nHn8P5Xrwa+tUCSoGaeg==
X-Gm-Gg: AYBFou2w/YP76mq3Y+t7dRvalCB0CdqVpmCP8zNSUguEFJ4E/OWiZGisqwfPoVMapzX
	V1mt64OcuWUknL3kLdfNBnNpq2TLdq8B/3t4N5OcdboFTiAv9du1VD7fOf+04VR2WaS1+wSd8Hp
	CEuMmby/YaKT3OSjHpZV3Ao7rXafU8hUdWp1R32VAJtnwltt6LiClmJjrvkcaDAicfJ8cLcXcQN
	MF9pC8yXGfHyF9jVxaD0FfwJ4k3pV9NHrqBA5W0+DSa35rFHwZQfMrnr7UMkjoSxT4d+eo7WoM1
	o7H/jj3jywFW7qVJIsb6quqGfxIrVLx3N1ntVtzmj+BfJSniqN96yxzwFBI09tASKvhkMFE52ko
	V2AKaop1ccGwb8/Qo2hEqwZw7qwoUlo3s4dajfPuaf3gAAFSqN0mNS6FPvlWWhvenphsDpGlTNq
	wmdobRw5fAWCDVdQWwRVPpDXcY+iBZpdY1ShY4zmowMS3CSMmU8hqaYqWzA3uFkmeJ+NUR++kCm
	ucaK+8QXhohETySbJ7af0DF/ybbYYG37zGjj4s0vcQGFwKYwSZgKEF342v1ZiUC+5aH9xQ+w+Ra
	YTcLTXbRbGT/pW1yfZJnPmfPmd6an6buA+IsDVpBgZ2Lnw==
X-Received: by 2002:a05:6830:914:b0:80c:d30f:97a with SMTP id 46e09a7af769-860f294e49dmr1058089a34.27.1794365245058;
        Tue, 10 Nov 2026 18:47:25 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f7b4sm3385800a34.4.2026.11.10.18.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:47:23 -0800 (PST)
Message-ID: <9d13c622-4e8e-4a69-be47-31861f6972d5@gmail.com>
Date: Tue, 10 Nov 2026 20:47:21 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: force command mode in
 mtk_dsi_poweron()
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
 <8c8ff7e2-d1a4-45c8-aacf-bca93439a32d@gmail.com>
 <524b9675fd10d0d21880821c10a4f0e188d24956.camel@mediatek.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <524b9675fd10d0d21880821c10a4f0e188d24956.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_184726_321150_3F8483E4 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 8:43 PM, CK Hu (胡俊光) wrote:
> Hi, I'm Chun-Kuang [1].
> It's not necessary to resend.
> I would apply this patch later.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=93e97f715b24114169d18654e09c646fd9e14979
>
> Chun-Kuang.

Hi Chun-Kuang,

I'm so sorry, my brain must be taking a day off :p thank you for the 
response!

Best Regards,
Ryan Brue

