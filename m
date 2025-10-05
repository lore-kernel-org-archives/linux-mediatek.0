Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD169CAC5BB
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Oct 2025 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLbCSnPzxk3Pd2cfZv75N/9WHUkvGEISioC9aAo2FWg=; b=f4h3dixmGoLd1LfpILRWMx7yZj
	PZF8KwGJlJTpeklRiobl/L6M8Wi+MJEc+RuxCLrB1tKiv05L2Mjww6xWcVfQOBjxwJpO7C8oGD3/8
	JTASUflJFM/jvNw6seR+9kevnVMkrn4oj3QTPDZ97zXLTUv9vmaDejlfhNOP3q4Tlnl6ravbcW55P
	uUUmlmSz++nJMfHt4nSG+SjHZso9V3ED67YI8/42722mh5mM0Zhd8On3ujA3SniAmkgAy6EJCeQRL
	3gqz97kwCKeDkD2eGNwlsSMUWDu1ll8ztN8kHAYyzS8Tini28SiPTlnqs+Nw4ohnEBwPEI+jF2RQc
	Mll/9LZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7AE0-00000008FYB-1H9W;
	Fri, 10 Oct 2025 10:19:48 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Iuy-0000000EHqL-1XbO
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Oct 2025 07:12:29 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6398ff5fbd3so79122a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Oct 2025 00:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759648346; x=1760253146; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uLbCSnPzxk3Pd2cfZv75N/9WHUkvGEISioC9aAo2FWg=;
        b=O0Rxo5WUO+7qmwde3BPdBln1JmQELrR78wjoc5Ny+lAAxuS7rfoV6jq360o7Gshswz
         5sGtDQrF9lzF8krYImj7h1oWPx9Y6ERCPuW5hlGVFPVz8qy417p1oswNoaQ5ufldgs0J
         rLJUmOQIKsicF3lectf+YoNxSn7wLvejLO1+hbiweQUZHjQO3eGhuzEIuyUjs3Br18I0
         oH8YT2ONzZY5Z/JpjYnfAfVVESz7knWjmIKRjyL59/2MZcV6te6E25W5o51PiBVZ4Oa/
         QPXbhWHG/P7e7YkK8SGa9oUQTeeFhGMFjhVjjVcGRMsbKFIGaMDU82uuwL7QMMRMz6fl
         2P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759648346; x=1760253146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLbCSnPzxk3Pd2cfZv75N/9WHUkvGEISioC9aAo2FWg=;
        b=LZrwvA56RnF+GL07h/a3RazPgSHsahejCHswGlchf73lH4jInV8oumfDG3Yeb7IiIm
         +dBpIXk5wfMcOUar2O07gJoTMsYJnm74A4ruOgKW3H5JPlWsKkrlCSi40Bp1RSZokc+j
         QuIn5bVdc/Ysa+bhBgLRDm8Xui20TeXstumcEYpiGk8JgY/r1axctngelNWBh/zBg/Kf
         ZcRmhw1SIVerTG6MPrxhCaJQAUQahX3WdXVFLqiE2NQQ4XlbnZG1Zb9o+Tzi8hABfs9z
         uaKnzDr6sT91RFGAWv+fS1ptzhKJTl27+C9xK5naloDRnnAsvq3VoW7p35t60mQv9HLF
         0gdQ==
X-Gm-Message-State: AOJu0Yy47xxEAeV09RXtRlPDaglMKI+Xbfl1ZF2CM7EpXzXehXU4wXA8
	mPNyDnhEavK7uZEPem1U23eF++nuoav3CwEkPlCpmrgHMNAiysYDZwZXu9rqAFUkbvT7dIq1c6O
	eQz5QCvjaaJJkgsJJXGv4F+Aa1PuEVy8=
X-Gm-Gg: ASbGncsaZ89sOe7dcRwaG6YZ4YQDgxEd2hb/NskM04Ljv0gEyHjkmY+ZQX1LbMt0vAf
	grVOzSvem1CdgmU8ov/oMR7QtVPI/tnp6MkTEJMSb0lAMM5+C6TH3nEcLJ7hPeURC1YRqlnwDLI
	bmIu5Y3QUJgkqEny+GIWOEGnwLVnlV97cKPgxxBUX552iWoH8NFLKF/7EfA5NyjBL5PkeVhBVID
	2T0Wtf6KtS8ENHW1v5sKIR8lfRWWIGVPJje4ruSVxzORSGQWdiuD8FrVnXMeZPM9JMdt0zTdyEf
	yWHC3M0qUK62kZgBq1LT8g==
X-Google-Smtp-Source: AGHT+IEaPBqgxHA9mkRsw5U5GshfyfUI6tv0+FQCqIyqIgMWxhvQ3ZtfCt3ueV0hiB4VsTPxZMicA8Qi+UM3+mqAQlw=
X-Received: by 2002:a05:6402:40c4:b0:637:e490:4609 with SMTP id
 4fb4d7f45d1cf-63939c3d1c9mr9167635a12.31.1759648346239; Sun, 05 Oct 2025
 00:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAJxkQ2gADc+kvZhxz3ds-QSkg+c59DQdmtXLVwRF2pGFgFNL-A@mail.gmail.com>
In-Reply-To: <CAJxkQ2gADc+kvZhxz3ds-QSkg+c59DQdmtXLVwRF2pGFgFNL-A@mail.gmail.com>
From: Austin Justin <austinjustin4809@gmail.com>
Date: Sun, 5 Oct 2025 12:42:14 +0530
X-Gm-Features: AS18NWCh-Go5b09ggMRT_w8w5GXIx2rCfjQ6NaWUTEl5HGWub9C6sqG-upQZYzI
Message-ID: <CAJxkQ2iVpQBzLJcFawm9qvqQ=04=MxO9puD2ChgjyXL36h1w9A@mail.gmail.com>
Subject: =?UTF-8?Q?Fwd=3A_Request_for_Linux_Driver_Support_=E2=80=93_MediaTek_M?=
	=?UTF-8?Q?T7902_Wi=2DFi_and_Bluetooth_Chipset_on_Ubuntu_22=2E04_LTS?=
To: yder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	deren.wu@mediatek.com
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	kernel-team@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="0000000000009ba71f0640640e99"
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_001228_435821_4AB3BA53 
X-CRM114-Status: GOOD (  10.26  )
X-Mailman-Approved-At: Fri, 10 Oct 2025 03:19:47 -0700
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

--0000000000009ba71f0640640e99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Request for Linux Driver Support =E2=80=93 MediaTek MT7902 Wi-Fi and Blueto=
oth
Chipset on Ubuntu 22.04 LTS
---------- Forwarded message ---------
From: Austin Justin <austinjustin4809@gmail.com>
Date: Sun, 5 Oct 2025 at 12:37
Subject: Request for Linux Driver Support =E2=80=93 MediaTek MT7902 Wi-Fi a=
nd
Bluetooth Chipset on Ubuntu 22.04 LTS
To: <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
<sean.wang@mediatek.com>, <deren.wu@mediatek.com>
Cc: <linux-mediatek@lists.infradead.org>,
<linux-wireless@vger.kernel.org>, <kernel-team@lists.ubuntu.com>


Dear MediaTek Linux Driver Team,

I am writing to request official Linux driver support for the MediaTek
MT7902 Wi-Fi and Bluetooth chipset.

This hardware is present in my ASUS Vivobook X1605VA laptop running
Ubuntu 22.04 LTS, but it currently lacks native driver support in the
kernel and Ubuntu repositories.
The wireless and Bluetooth interfaces are not detected automatically,
and no compatible package is available through 'ubuntu-drivers' or
DKMS.

Hardware details:
------------------------------------------------------
$ lspci -nn | grep -i network
03:00.0 Network controller [0280]: MEDIATEK Corp. Device [14c3:7902]

Kernel version:
6.8.0-79-generic
------------------------------------------------------

Could you please advise if there are existing drivers for this
chipset, or if MediaTek plans to upstream support into the Linux
kernel?
If testing or logs are required, I would be happy to assist to help
ensure compatibility with Ubuntu and other Linux distributions.

Thank you for your time and support in improving Linux compatibility
with MediaTek devices.

Best regards,
Austin Justin
ASUS Vivobook X1605VA
Ubuntu 22.04 LTS

--0000000000009ba71f0640640e99
Content-Type: text/plain; charset="US-ASCII"; name="network_info.txt"
Content-Disposition: attachment; filename="network_info.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mgdd105m0>
X-Attachment-Id: f_mgdd105m0

ICAqLW5ldHdvcmsgVU5DTEFJTUVECiAgICAgICBkZXNjcmlwdGlvbjogTmV0d29yayBjb250cm9s
bGVyCiAgICAgICBwcm9kdWN0OiBNRURJQVRFSyBDb3JwLgogICAgICAgdmVuZG9yOiBNRURJQVRF
SyBDb3JwLgogICAgICAgcGh5c2ljYWwgaWQ6IDAKICAgICAgIGJ1cyBpbmZvOiBwY2lAMDAwMDow
MzowMC4wCiAgICAgICB2ZXJzaW9uOiAwMAogICAgICAgd2lkdGg6IDY0IGJpdHMKICAgICAgIGNs
b2NrOiAzM01IegogICAgICAgY2FwYWJpbGl0aWVzOiBwY2lleHByZXNzIG1zaSBwbSBjYXBfbGlz
dAogICAgICAgY29uZmlndXJhdGlvbjogbGF0ZW5jeT0wCiAgICAgICByZXNvdXJjZXM6IGlvbWVt
b3J5OjYwMC01ZmYgbWVtb3J5OjYwMDAwMDAwMDAtNjAwMDBmZmZmZiBtZW1vcnk6ODA4MDAwMDAt
ODA4MDdmZmYKICAqLW5ldHdvcmsKICAgICAgIGRlc2NyaXB0aW9uOiBFdGhlcm5ldCBpbnRlcmZh
Y2UKICAgICAgIHBoeXNpY2FsIGlkOiA5CiAgICAgICBidXMgaW5mbzogdXNiQDE6MQogICAgICAg
bG9naWNhbCBuYW1lOiBlbngyZTQwNzc2ZjBkNjMKICAgICAgIHNlcmlhbDogMmU6NDA6Nzc6NmY6
MGQ6NjMKICAgICAgIGNhcGFiaWxpdGllczogZXRoZXJuZXQgcGh5c2ljYWwKICAgICAgIGNvbmZp
Z3VyYXRpb246IGF1dG9uZWdvdGlhdGlvbj1vZmYgYnJvYWRjYXN0PXllcyBkcml2ZXI9cm5kaXNf
aG9zdCBkcml2ZXJ2ZXJzaW9uPTYuOC4wLTc5LWdlbmVyaWMgZHVwbGV4PWhhbGYgZmlybXdhcmU9
Uk5ESVMgZGV2aWNlIGlwPTE5Mi4xNjguMTYwLjE5NiBsaW5rPXllcyBtdWx0aWNhc3Q9eWVzIHBv
cnQ9dHdpc3RlZCBwYWlyCg==
--0000000000009ba71f0640640e99--

