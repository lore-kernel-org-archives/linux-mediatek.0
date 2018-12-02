From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] arm: mediatek: DT fixes for v4.20
Date: Sun, 2 Dec 2018 12:01:54 -0800
Message-ID: <CAOesGMimqGGL+3Dd8tyyJpb506j9-tJZP0FeSCkvKwuUGWAmAg@mail.gmail.com>
References: <d131fdd3-663c-9a5b-4296-94f2635f8c41@gmail.com>
 <5e3371a7-e4a3-49cc-b517-20902a5e2ed4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5e3371a7-e4a3-49cc-b517-20902a5e2ed4@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: ARM-SoC Maintainers <arm@kernel.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Sun, Dec 2, 2018 at 11:57 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Hi all,
>
> On 26/11/2018 11:34, Matthias Brugger wrote:
> > Hi Olof,
> > Hi Arnd,
> >
> > There two issues with the mt7622 based boards in the current v4.20-rc cycle.
> > Could you please pull the following fixes for the issues.
> >
> > Thanks,
> > Matthias
>
> I just saw, that this is not part of armsoc-fixes [1]
> Does it fall through the cracks or are there any comments?

Hi,

I pinged you on IRC, which I'm guessing you didn't see.

Your branch was based on -rc3 when the rest of fixes were on -rc1 for
this cycle. I asked if I could cherry-pick, but in the end I decided
to send what we have and just merge it once Linus picks it up (since
the new branch would be based on -rc4 or 5). So, it's on the list and
I'll merge it later today or tomorrow.


-Olof
