From: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] kasan: fix the missing underflow in memmove and memcpy with CONFIG_KASAN_GENERIC=y
Date: Tue, 8 Oct 2019 05:47:30 -0400
Message-ID: <B53A3CC0-CEA6-4E1C-BC38-19315D949F38@lca.pw>
References: <1570515358.4686.97.camel@mtksdccf07>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570515358.4686.97.camel@mtksdccf07>
Sender: linux-kernel-owner@vger.kernel.org
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org



> On Oct 8, 2019, at 2:16 AM, Walter Wu <walter-zh.wu@mediatek.com> wrote:
>=20
> It is an undefined behavior to pass a negative numbers to
>    memset()/memcpy()/memmove(), so need to be detected by KASAN.

Why can=E2=80=99t this be detected by UBSAN?=
